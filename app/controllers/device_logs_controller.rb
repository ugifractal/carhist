class DeviceLogsController < ApplicationController
  before_action :set_logger

  def index
    @logs = @device_logger.device_logs.paginate(per_page: 20, page: params[:page])
  end

  private

  def set_logger
    @car = current_user.company.cars.find(params[:car_id])
    @device_logger = @car.device_loggers.find(params[:device_logger_id])
  end
end
