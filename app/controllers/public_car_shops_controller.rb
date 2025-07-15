module Public
  class CarShopsController < ApplicationController
    def show
      @car_shop = CarShop.find_by(id: params[:id])
    end
    end
  end
end

