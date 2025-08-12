class CarShop < ApplicationRecord
  belongs_to :company
  validates :name, :category, :description, presence: true
  scope :approved, -> { where.not(approved_at: nil) }
  scope :pending, -> { where(approved_at: nil) }
end
