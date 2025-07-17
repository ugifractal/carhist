class CarShop < ApplicationRecord
  belongs_to :user
  validates :name, :category, :description, presence: true
  scope :approved, -> { where.not(approved_at: nil) }
end
