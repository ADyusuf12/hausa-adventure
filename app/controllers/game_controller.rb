# app/controllers/game_controller.rb
class GameController < ApplicationController
  before_action :initialize_player

  # GET /
  # GET /game
  def show
    @room = @player.room
    @choices = @room.choices
  end

  def choose
    @choice = @player.room.choices.find_by!(choice_identifier: params[:choice_identifier])

    unless @choice.available_to?(@player)
      redirect_to game_path, alert: "You do not meet the conditions for this path." and return
    end

    if @choice.roll_type.present?
      @roll_result = CowrieEngine.generate_check(@player, @choice)
      render :roll_check
    else
      apply_choice_effects!(@choice)

      # Transition player state internally
      target_room = Room.find_by!(slug: @choice.target_room_slug)
      @player.update!(room: target_room)
      @room = target_room
      @choices = @room.choices

      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: [
            turbo_stream.update("game_scene", partial: "game/scene_content"),
            turbo_stream.update("stat-daura-elders", @player.reputation_for("daura_elders").to_s),
            turbo_stream.update("stat-daura-army", @player.reputation_for("daura_army").to_s) # <-- Added
          ]
        end
        format.html { redirect_to game_path }
      end
    end
  end

  def resolve_roll
    raw_payload = CowrieEngine.verify_and_decrypt(params[:roll_token])

    # Wrap the hash so both strings and symbols resolve identically
    payload = raw_payload&.with_indifferent_access

    if payload.nil? || payload[:player_id] != @player.id
      Rails.logger.error "❌ FAILED CRYPTO VALIDATION - Payload: #{payload.inspect} | Expected Player ID: #{@player&.id}"
      redirect_to game_path, alert: "Cryptographic state corruption detected or token expired." and return
    end

    # 1. Safely locate the origin choice from the player's current room location
    origin_choice = @player.room.choices.find_by(choice_identifier: payload[:choice_identifier])

    # 2. Apply item drops or faction bonuses if the roll passed
    if payload[:passed] && origin_choice.present?
      apply_choice_effects!(origin_choice)
    end

    # 3. Transition the player record to the destination slug inside the database
    @room = Room.find_by!(slug: payload[:target_room_slug])
    @player.update!(room: @room)

    # 4. Force reload to clear active association caches
    @player.reload
    @choices = @room.choices

    # 5. Stream the freshly updated target room directly to the screen
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: [
          turbo_stream.update("game_scene", partial: "game/scene_content"),
          turbo_stream.update("stat-daura-elders", @player.reputation_for("daura_elders").to_s),
          turbo_stream.update("stat-daura-army", @player.reputation_for("daura_army").to_s) # <-- Added
        ]
      end
      format.html { redirect_to game_path }
    end
  end

  def restart
    # Wrap in a transaction to ensure atomic rollback if anything goes sideways
    ActiveRecord::Base.transaction do
      # Clear out the player record completely to purge inventory and state tracking
      @player.destroy if @player.present?

      # Clear session values tracking the player identity
      session[:player_id] = nil
    end

    flash[:notice] = "The ancestors grant you a new thread of fate. Your journey begins anew."

    # Redirect back to the root game initialization loop
    redirect_to root_path
  end

  private

  # Unified state mutation engine for item drops and faction score updates
  def apply_choice_effects!(choice)
    return if choice.effects_json.blank?

    # Force effects into an array loop structure to handle any YAML shape safely
    effects_list = Array(choice.effects_json)

    effects_list.each do |effect_item|
      next unless effect_item.is_a?(Hash)

      # 1. Process structured list item rewards using your Player model method
      if effect_item["receive_item"].present?
        @player.pick_up_item(effect_item["receive_item"])
      end

      # 2. Process structured reputation adjustments using your Player model method
      if effect_item["reputation"].is_a?(Hash)
        effect_item["reputation"].each do |faction, modifier|
          @player.modify_reputation(faction, modifier)
        end
      end
    end

    # Handle flat root-level keys if they exist on the top level directly
    if choice.effects_json.is_a?(Hash)
      root_effects = choice.effects_json
      if root_effects["receive_item"].present?
        @player.pick_up_item(root_effects["receive_item"])
      end
      if root_effects["reputation"].is_a?(Hash)
        root_effects["reputation"].each do |faction, modifier|
          @player.modify_reputation(faction, modifier)
        end
      end
    end
  end

  def initialize_player
    if session[:player_id]
      @player = Player.find_by(id: session[:player_id])
    end

    if @player.nil?
      prologue_room = Room.find_by(slug: "daura-prologue-001")

      if prologue_room.nil?
        raise "Engine state error: Please seed the Daura Prologue room node first by running bin/rails db:seed."
      end

      @player = Player.create!(
        name: "Bayajidda's Heir",
        room: prologue_room,
        inventory_json: [],
        reputation_json: {}
      )
      session[:player_id] = @player.id
    end
  end

  def execute_room_transition(target_slug)
    target_room = Room.find_by!(slug: target_slug)
    @player.update!(room: target_room)
    redirect_to game_path
  end
end
