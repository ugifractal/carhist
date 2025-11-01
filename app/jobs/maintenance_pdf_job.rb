class MaintenancePdfJob < ApplicationJob
  def perform(car_id:, keyword:, categories:)
    car = Car.find(car_id)
    car_maintenances = car.car_maintenances.generate_pdf(keyword:, categories:)
  end
end
