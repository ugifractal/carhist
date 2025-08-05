module Public
  class CarModelsController < PublicBaseController
    def index
      @car_models = CarModel
                      .includes(:car_brand)
                      .order(created_at: :desc)
                      .paginate(page: params[:page], per_page: 5)

        respond_to do |format|
            format.html { render layout: "welcome" }
            format.json { render json: @car_models }
        end
    end

    def show
      @car_model = CarModel.find(params[:id])

      render layout: "welcome"
    end
  end
end
