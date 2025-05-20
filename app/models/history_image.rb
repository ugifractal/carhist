class HistoryImage < ApplicationRecord
  include ImageUploader::Attachment(:image)

  belongs_to :car_maintenance
  has_one_attached :image
end
