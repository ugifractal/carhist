class DeviceLoggersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_car

  def index
    @device_loggers = @car.device_loggers.order(name: :asc).paginate(page: params[:page], per_page: 20)
  end

  def new
    @device_logger = @car.device_loggers.new
  end

  def show
    @device_logger = @car.device_loggers.find(params[:id])
  end

  def create
    @device_logger = case params[:logger_type]
    when "hotswitch"
      @car.hotswitch_loggers.new(device_logger_params)
    else
      @car.device_loggers.new(device_logger_params)
    end

    if @device_logger.save
      flash[:notice] = "Device logger has been created."
      redirect_to car_device_logger_path(@car, @device_logger)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @device_logger = @car.device_loggers.find(params[:id])
    @device_logger.destroy
    flash[:notice] = "Device Logger has been deleted."
    redirect_to car_device_loggers_path(@car)
  end

  private

  def set_car
    @car = current_user.company.cars.find(params[:car_id])
  end

  def device_logger_params
    params.expect(device_logger: %i[name])
  end
end
