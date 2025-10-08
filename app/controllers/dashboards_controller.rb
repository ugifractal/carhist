class DashboardsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_company

  def show
    @cars = @company.cars
    @pending_order = current_user.company.pending_order
    @recent_service = current_user.company.car_maintenances
      .order(performed_at: :desc)
      .first
  end

  private

  def set_company
    @company = current_user.company
  end
end
