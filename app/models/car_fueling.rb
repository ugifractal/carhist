class CarFueling < ApplicationRecord
  belongs_to :car
  validates :volume, numericality: { only_integer: false, greater_than: 0 }, presence: true
end
