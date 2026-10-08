# app/models/room.rb
class Room < ApplicationRecord
  has_many :choices, dependent: :destroy

  validates :slug, presence: true, uniqueness: true
  validates :title, :description_md, presence: true

  # Returns the assigned illustration or a default mythic background
  def illustration_path
    image_filename.presence || "illustrations/default-parchment.png"
  end
end
