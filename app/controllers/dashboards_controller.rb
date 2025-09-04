class DashboardsController < ApplicationController
  before_action :authenticate_user!

  def show
    @pending_order = current_user.company.pending_order
    @cars = current_user.company.cars
    @car_maintenances = current_user.company.car_maintenances
    @recent_service = current_user.company.car_maintenances
      .joins(:car)
      .where(cars: { company_id: current_user.company_id })
      .order(performed_at: :desc)
      .first
  end
end
