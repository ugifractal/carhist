module Public
  class CarMaintenancesController < PublicBaseController
    def show
      @car_maintenance = CarMaintenance.find_by(token: params[:token])

      render layout: "welcome"
    end
  end
end
