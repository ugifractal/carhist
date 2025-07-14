class PublicCarShopsController < ApplicationController
  def show
    @car_shop = CarShop.find_by(id: params[:id], approved_at: !nil)
  end
end
