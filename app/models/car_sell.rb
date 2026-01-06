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

  before_create :generate_token

  def wa_phone
    number = phone.gsub("+", "")
    if number.starts_with?("0")
      return number.sub("0", "62")
    elsif number.starts_with?("62")
      return number
    end
    phone
  end

  private

  def generate_token
    self.token = SecureRandom.hex(5)
  end
end
