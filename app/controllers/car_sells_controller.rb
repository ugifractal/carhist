class CarSellsController < ApplicationController
  before_action :set_car

  def new
    @car_sell = @car.car_sell || @car.build_car_sell
  end

  def edit
    @car_sell = @car.car_sell
  end

  def create
    @car_sell = @car.car_sell || @car.build_car_sell(car_sell_params)
    if @car_sell.save
      redirect_to(car_car_sells_path(@car), notice: t("controller.car_sells.created"))
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

  private

  def car_sell_params
    params.expect(car_sell: %i[description price status phone])
  end

  def set_car
    @car = current_company.cars.find(params[:car_id])
  end
end
