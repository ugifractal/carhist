class CarSellImage < ApplicationRecord
  include ImageUploader::Attachment(:image)
  belongs_to :car_sell
end
