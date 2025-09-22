class DashboardsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_company

  def show
    @pending_order = @company.pending_order
    @cars = @company.cars
    @recent_service = @company.car_maintenances
      .includes(car: :car_model)
      .order(performed_at: :desc)
      .first
  end

  private

  def set_company
    @company = current_user.company
  end
end
