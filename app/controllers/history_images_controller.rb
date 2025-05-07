class HistoryImagesController < ApplicationController
  before_action :set_car_maintenance

  def index
    @history_images = @car_maintenance.history_images
  end

  def create
    @history_image = @car_maintenance.history_images.new(image: params[:file])
    if @history_image.save
      render json: {}, status: :ok
    else
      render json: { error: @history_image.errors.first.full_message }, status: :unprocessable_entity
    end
  end

  def destroy
    @history_image = @car_maintenance.history_images.find(params[:id])
    @history_image.destroy
    redirect_to(car_car_maintenance_history_images_path(@car, @car_maintenance), notice: "image has been deleted")
  end

  private

  def set_car_maintenance
    @car = current_user.cars.find(params[:car_id])
    @car_maintenance = @car.car_maintenances.find(params[:car_maintenance_id])
  end
end
