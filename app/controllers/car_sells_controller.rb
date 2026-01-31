class CarSellsController < ApplicationController
  before_action :set_car, only: [ :new, :create, :edit, :update, :destroy ]

  def index
    @car_sells = current_company.car_sells.includes(:car).order(created_at: :desc)
  end

  def new
    @car_sell = @car.car_sell || @car.build_car_sell
  end

  def edit
    @car_sell = @car.car_sell
    @car_sell_images = @car_sell.car_sell_images
  end

  def create
    @car_sell = @car.car_sell || @car.build_car_sell(car_sell_params)
    if @car_sell.save
      redirect_to(edit_car_car_sells_path(@car), notice: t("controller.car_sells.created"))
    else
      render action: :new
    end
  end

  def update
    @car_sell = @car.car_sell

    if @car_sell.update(car_sell_params)
      redirect_to(car_car_sells_path(@car), notice: t("controller.car_sells.updated"))
    else
      render action: :new
    end
  end

  def destroy
    @car.car_sell.destroy
    redirect_to(car_path(@car), notice: t("controller.car_sells.deleted"))
  end

  private

  def car_sell_params
    params.expect(car_sell: %i[description price status phone village_id district_id regency_id province_id show_service_history])
  end

  def set_car
    @car = current_company.cars.find(params[:car_id])
  end
end
