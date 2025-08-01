module Public
  class CarShopsController < PublicBaseController
    def index
      @car_shops = CarShop.where.not(approved_at: nil)
                          .order(approved_at: :desc)
                          .paginate(page: params[:page], per_page: 10)

      respond_to do |format|
        format.html { render layout: "welcome" }
        format.json { render json: @car_shops }
      end
    end

    def show
      @car_shop = CarShop.approved.find(params[:id])

      render layout: "welcome"
    end
  end
end
