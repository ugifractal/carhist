class CarBrand < ApplicationRecord
    has_many :car_models

    validates :name, presence: true, uniqueness: { case_sensitive: false, message: "Brand already exists" }
end
