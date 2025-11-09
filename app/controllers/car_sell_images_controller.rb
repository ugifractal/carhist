class CarSellImagesController < ApplicationController
  before_action :set_car_sell

  def index
    @car_sell_images = @car_sell.car_sell_images
    render json: { car_sell_images: @car_sell_images.map { |x| CarSellImageSerializer.new(x).to_h } }
  end

  def create
    @car_sell_image = @car_sell.car_sell_images.new(image: params[:file])
    if @car_sell_image.save
      render json: { car: { id: @car.id }, car_sell_image: { id: @car_sell_image.id, url: @car_sell_image.image.url, show_url: car_car_sells_car_sell_image_path(@car, @car_sell_image) } }, status: :ok
    else
      render json: { error: @car_sell_image.errors.first.full_message }, status: :unprocessable_entity
    end
  end

  def show
    @car_sell_image = @car_sell.car_sell_images.find(params[:id])
  end

  def destroy
    @car_sell_image = @car_sell.car_sell_images.find(params[:id])
    @image = @car_sell_image
    @car_sell_image.destroy
  end

  private

  def set_car_sell
    @car = current_user.company.cars.find(params[:car_id])
    @car_sell = @car.car_sell
  end
end
