class CarShopsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_car_shop, only: [ :show, :edit, :update, :destroy ]

  def index
    @car_shops = CarShop.where(user_id: current_user.id)
                        .paginate(page: params[:page], per_page: 20)

    respond_to do |format|
      format.html
      format.json { render json: @car_shops }
    end
  end

  def show
  end

  def new
    @car_shop = CarShop.new
  end

  def create
    @car_shop = current_user.car_shops.build(car_shop_params)
    @car_shop.user_id = current_user.id

    if @car_shop.save
      redirect_to car_shops_path, notice: "Car shop successfully created."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @car_shop.update(car_shop_params)
      redirect_to car_shops_path, notice: "Car shop successfully updated."
    else
      render :edit
    end
  end


  def destroy
    @car_shop.destroy!
    respond_to do |format|
      format.html { redirect_to car_shops_path, status: :see_other, notice: "Car Shop was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_car_shop
      @car_shop = CarShop.find(params[:id])
    end

  def car_shop_params
    params.require(:car_shop).permit(:name, :category, :description)
  end
end
