class MaintenanceReportsController < ApplicationController
  before_action :set_car

  def index
    @maintenance_reports = @car.maintenance_reports.order(created_at: :desc).paginate(per_page: 10, page: params[:page])
  end

  private

  def set_car
    @car = current_company.cars.find(params[:car_id])
  end
end
