class CarModel < ApplicationRecord
  belongs_to :car_brand
  has_many :cars
end
