class CarMaintenance < ApplicationRecord
  belongs_to :car
  has_many :history_images, dependent: :destroy
  belongs_to :car_shop, optional: true
  validates :maintenance_type, :description, :title, presence: true
end
