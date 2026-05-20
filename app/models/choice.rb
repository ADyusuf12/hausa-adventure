class Choice < ApplicationRecord
  belongs_to :room
  validates :choice_identifier, :text, :target_room_slug, presence: true

  # Verifies if a player meets specific conditions (e.g., item checks)
  def available_to?(player)
    return true if conditions_json.blank?

    if conditions_json["has_item"].present?
      return player.inventory_json.include?(conditions_json["has_item"])
    end

    true
  end
end
