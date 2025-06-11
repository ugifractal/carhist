module Admin
  class CarShopsController < AdminBaseController
    before_action :authenticate_user!

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

    private

    def car_shop_params
      params.require(:car_shop).permit(:name, :user_id, :category)
    end
  end
end
