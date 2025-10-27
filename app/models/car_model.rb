class CarModel < ApplicationRecord
  belongs_to :car_brand
  has_many :cars, dependent: :destroy

  def full_name
    "#{car_brand.name} #{model}"
  end
end
