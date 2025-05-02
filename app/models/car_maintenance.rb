class CarMaintenance < ApplicationRecord
  belongs_to :car

  validates :car_id, :maintenance_type, :description, presence: true

end
