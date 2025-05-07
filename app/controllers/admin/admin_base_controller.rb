module Admin
  class AdminBaseController < ApplicationController
    layout "admin"
    before_action :authenticate_user!
    before_action :admin_only

    def admin_only
      unless current_user.admin?
        flash[:notice] = "You have no privilege to access this page"
        redirect_to("/")
      end
    end
  end
end
