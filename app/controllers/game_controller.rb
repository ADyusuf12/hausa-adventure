# app/controllers/game_controller.rb
class GameController < ApplicationController
  before_action :initialize_player

  # GET /
  # GET /game
  def show
    @room = @player.room
    @choices = @room.choices
  end

  # POST /game/choose
  def choose
    choice = @player.room.choices.find_by!(choice_identifier: params[:choice_identifier])

    unless choice.available_to?(@player)
      redirect_to game_path, alert: "You do not meet the conditions for this path." and return
    end

    # Process side effects (e.g., changes to reputation) Safely
    if choice.effects_json.present? && choice.effects_json["reputation"].is_a?(Hash)
      choice.effects_json["reputation"].each do |faction, mod|
        @player.modify_reputation(faction, mod)
      end
    end

    # Move player to the target room
    target_room = Room.find_by!(slug: choice.target_room_slug)
    @player.update!(room: target_room)

    redirect_to game_path
  end

  private

  def initialize_player
    # Fetch existing player from session or seed a fresh prologue state
    if session[:player_id]
      @player = Player.find_by(id: session[:player_id])
    end

    if @player.nil?
      # Ensure at least our first room node is seeded
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
end
