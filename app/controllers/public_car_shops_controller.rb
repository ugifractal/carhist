module Public
  class CarShopsController < ApplicationController
    def show
      @car_shop = CarShop.find_by(id: params[:id], approved_at: !nil)

      if @car_shop.nil?
      render plain: "Car Shop not found or not approved", status: :not_found
      elsif params[:slug] != @car_shop.name.parameterize
      redirect_to public_car_shop_path(@car_shop.id, @car_shop.name.parameterize), status: :moved_permanently
    end
    end
  end
end

