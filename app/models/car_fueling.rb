class CarFueling < ApplicationRecord
  belongs_to :car
  validates :volume, numericality: { only_integer: false, greater_than: 0 }, presence: true

  def fuel_avg
    return nil if volume.nil? || distance.nil?
    return nil if volume.zero?

    "1 : #{(distance / volume).round(1)}"
  end
end
