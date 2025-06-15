class CarShop < ApplicationRecord
  belongs_to :user
  belongs_to :car_maintenances
  validates :name, :category, presence: true
end
