class CarMaintenance < ApplicationRecord
  belongs_to :car

  validates :car_id, :maintenance_type, :description, presence: true

  def self.search(search)
    if search.present?
      where("maintenance_type ILIKE ?", "%#{search}%")
    else
      all
    end
  end
end
