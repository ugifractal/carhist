class DeviceLogsController < ApplicationController
  before_action :set_logger

  def index
    @logs = @device_logger.device_logs.paginate(per_page: 20, page: params[:page])
  end

  def graph
  end

  def graph_data
    @logs = @device_logger.device_logs.order(created_at: :desc).limit(1000)
    render json: @logs.map { |x| HotswitchLogSerializer.new(x, @tz).to_h }
  end

  private

  def set_logger
    @car = current_user.company.cars.find(params[:car_id])
    @device_logger = @car.device_loggers.find(params[:device_logger_id])
  end
end
