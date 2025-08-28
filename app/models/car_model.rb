class CarModel < ApplicationRecord
  belongs_to :car_brand

  def full_name
    "#{car_brand.name} #{model}"
  end
end
