module Admin
  class CarShopsController < AdminBaseController
    before_action :authenticate_user!
    before_action :set_car_shop, only: %i[ show edit update destroy ]

    def index
      @car_shops = current_user.car_shops.paginate(page: params[:page], per_page: 20)

      respond_to do |format|
        format.html
        format.json { render json: @car_shops }
      end
    end

    def new
      @users = User.all
      @car_shop = CarShop.new
    end

    def create
      @users = User.all
      @car_shop = CarShop.new(car_shop_params)

      if @car_shop.save
        redirect_to admin_car_shops_path, notice: "Car shop successfully created."
      else
        render :new
      end
    end

    def update_submitted_by
      @shop = CarShop.find(params[:id])
      @shop.update(submitted_by: params[:car_shop][:submitted_by])
      redirect_to admin_car_shops_path, notice: "Submitted by updated."
    end

    def edit
      @users = User.all
    end

    def update
      if @car_shop.update(car_shop_params)
        redirect_to admin_car_shops_path, notice: 'Car shop updated successfully.'
      else
        render :edit
      end
    end

    def destroy
      @car_shop.destroy
      redirect_to admin_car_shops_path, notice: 'Car shop was successfully deleted.'
    end

    private

    def set_car_shop
      @car_shop = CarShop.find(params.expect(:id))
    end

    def car_shop_params
      params.require(:car_shop).permit(:name, :user_id, :approved_at)
    end
  end
end
