  class Car < ApplicationRecord
    belongs_to :user
    belongs_to :car_model
    has_many :car_maintenances, dependent: :destroy

    validates :name, presence: true

    has_one_attached :image

    def brand_name
      "#{car_model.car_brand.name} #{car_model.model} #{car_model.year}"
    end
  end
