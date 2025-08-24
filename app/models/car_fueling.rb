class CarFueling < ApplicationRecord
  belongs_to :car
  validates :volume, numericality: { only_integer: false, greater_than: 0 }, presence: true
  validates :distance, numericality: { only_integer: false, greater_than: 0 }, presence: true

  def fuel_avg
    return 0 if volume.zero?

    distance / volume
  end
end
