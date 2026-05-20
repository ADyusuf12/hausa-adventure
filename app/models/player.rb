class Player < ApplicationRecord
  belongs_to :room
  validates :name, presence: true

  def add_to_inventory(item_slug)
    self.inventory_json << item_slug unless inventory_json.include?(item_slug)
    save
  end

  def modify_reputation(faction, amount)
    self.reputation_json[faction] = (reputation_json[faction] || 0) + amount
    save
  end
end
