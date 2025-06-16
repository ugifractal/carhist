class CarShop < ApplicationRecord
  belongs_to :user
  validates :name, :category, :description, presence: true
end
