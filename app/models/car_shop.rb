class CarShop < ApplicationRecord
  belongs_to :user
  validates :name, :category, :description, :approved_at, presence: true
end
