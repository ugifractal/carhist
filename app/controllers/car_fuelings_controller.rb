class CarFuelingsController < ApplicationController
  before_action :set_car

  def index
    @car_fuelings = @car.car_fuelings.paginate(per_page: 20, page: params[:page])
  end

  def create
    volume = (car_fueling_params[:volume].to_f * 100).to_i
    @car_fueling = @car.car_fuelings.new(car_fueling_params)
    @car_fueling.volume = volume

    if @car_fueling.save
      redirect_to(car_car_fueling_path(@car, @car_fueling))
    else
      render action: "new"
    end
  end

  def edit
    @car_fueling = @car.car_fuelings.find(params[:id])
  end

  def update
    volume = (car_fueling_params[:volume].to_f * 100).to_i
    @car_fueling = @car.car_fuelings.find(params[:id])
    @car_fueling.volume = volume
    if @car_fueling.update(car_fueling_params)
      redirect_to(car_car_fueling_path(@car, @car_fueling))
    else
      render action: "edit"
    end
  end

  def show
    @car_fueling = @car.car_fuelings.find(params[:id])
  end

  def new
    @car_fueling = @car.car_fuelings.new
  end

  private

  def car_fueling_params
    params.require(:car_fueling).permit(:km, :location, :filled_at, :ron_number, :fuel_range, :price, :volume)
  end

  def set_car
    @car = current_user.cars.find(params[:car_id])
  end
end
