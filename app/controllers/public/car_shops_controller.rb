module Public
  class CarShopsController < PublicBaseController
    def show
      @car_shop = CarShop.where("approved_at is not null and id = ?", params[:id]).first

      if @car_shop.nil?
        redirect_to root_path, alert: "Car shop not found or not approved."
      else
        render :show
      end
    end
  end
end

