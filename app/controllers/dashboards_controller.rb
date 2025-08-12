class DashboardsController < ApplicationController
  before_action :authenticate_user!

  def show
    @pending_order = current_user.company.pending_order
    @cars = current_user.company.cars
  end
end
