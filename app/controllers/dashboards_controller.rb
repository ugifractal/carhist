class DashboardsController < ApplicationController
  before_action :authenticate_user!

  def show
    @pending_order = current_user.company.pending_order
  end
end
