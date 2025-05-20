class Car < ApplicationRecord
  include ImageUploader::Attachment(:image)
  belongs_to :user
  belongs_to :car_model
  has_many :car_maintenances, dependent: :destroy
  has_many :car_fuelings, dependent: :destroy

  validates :name, presence: true

  def brand_name
    "#{car_model.car_brand.name} #{car_model.model} #{car_model.year}"
  end
end
