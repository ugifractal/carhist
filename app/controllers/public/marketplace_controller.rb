module Public
  class MarketplaceController < ApplicationController
    def index
      @cars = Car.joins(:car_sell).where(car_sells: { status: "for_sale" })
    end
  end
end
