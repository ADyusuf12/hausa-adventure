# app/models/player.rb
class Player < ApplicationRecord
  belongs_to :room

  validates :name, presence: true

  # Check if a specific string identifier exists anywhere inside the array cache
  def has_item?(item_slug)
    return false if inventory_json.nil?
    inventory_json.include?(item_slug)
  end

  # Helper to add an item safely without generating duplicate items
  def pick_up_item(item_slug)
    self.inventory_json ||= []
    unless inventory_json.include?(item_slug)
      self.inventory_json << item_slug
      save!
    end
  end

  # Read a faction reputation tier safely without triggering nil errors
  def reputation_for(faction)
    return 0 if reputation_json.nil?
    reputation_json[faction.to_s].to_i
  end

  # Modify a reputation score inline
  def modify_reputation(faction, amount)
    self.reputation_json ||= {}
    current = reputation_json[faction.to_s].to_i
    reputation_json[faction.to_s] = current + amount.to_i
    save!
  end
end
