module Public
  class MarketplaceController < ApplicationController
    layout "welcome"

    def index
      @cars = Car.joins(:car_sell).where(car_sells: { status: "for_sale" }).paginate(page: params[:page], per_page: 50)
    end
  end
end
