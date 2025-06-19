class MaintenanceSettingsController < ApplicationController
  def show
    @car = Car.find(params[:car_id])
  end
end
