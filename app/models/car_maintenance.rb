class CarMaintenance < ApplicationRecord
  belongs_to :car
  has_many :history_images, dependent: :destroy
  has_many :car_shops
  validates :car_shop, :maintenance_type, :description, :title, presence: true
end
