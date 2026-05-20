class Room < ApplicationRecord
  has_many :choices, dependent: :destroy
  validates :slug, presence: true, uniqueness: true
  validates :title, :description_md, presence: true
end
