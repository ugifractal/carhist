class CarShop < ApplicationRecord
  belongs_to :user
  validates :name, :category, presence: true
end
