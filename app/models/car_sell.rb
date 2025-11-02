class CarSell < ApplicationRecord
  STATUS_DESC_NOT_FOR_SALE = "model.car_sell.status_desc_not_for_sale"
  STATUS_DESC_FOR_SALE = "model.car_sell.status_desc_for_sale"
  STATUS_DESC_SOLD = "model.car_sell.status_desc_sold"

  belongs_to :car
  has_many :car_sell_images
  belongs_to :province
  belongs_to :regency
  belongs_to :district
  belongs_to :village
end
