class HistoryImagesController < ApplicationController
  before_action :set_car_maintenance

  def index
    @history_images = @car_maintenance.history_images
    @history_image = @car_maintenance.history_images.new
  end

  private

  def set_car_maintenance
    @car = current_user.cars.find(params[:car_id])
    @car_maintenance = @car.car_maintenances.find(params[:car_maintenance_id])
  end
end