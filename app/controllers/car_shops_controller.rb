class CarShopsController < ApplicationController
  before_action :authenticate_user!

  def index
    @car_shops = CarShop.paginate(page: params[:page], per_page: 20)
  end

  def new
    @car_shop = CarShop.new
  end

  def create
    @car_shop = current_user.car_shops.build(car_shop_params)
    @car_shop.submitted_by = current_user.id

    if @car_shop.save
      redirect_to car_shops_path, notice: "Car shop successfully created."
    else
      render :new
    end
  end

  private

  def car_shop_params
    params.require(:car_shop).permit(:name)
  end
end
