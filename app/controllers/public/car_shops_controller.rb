module Public
  class CarShopsController < PublicBaseController
    def show
      @car_shop = CarShop.approved.find(params[:id])

      if @car_shop.nil?
        redirect_to root_path, alert: "Car shop not found or not approved."
      else
        render :show
      end
    end
  end
end

