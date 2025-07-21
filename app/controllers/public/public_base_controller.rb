module Public
  class PublicBaseController < ApplicationController
    def index
      @car_shops = CarShop.where.not(approved_at: nil)
                          .order(approved_at: :desc)
                          .paginate(page: params[:page], per_page: 10)

      respond_to do |format|
        format.html {render layout: "welcome" }
        format.json { render json: @car_shops }
      end
    end
  end
end
