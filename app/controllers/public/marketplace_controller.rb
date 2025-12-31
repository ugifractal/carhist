module Public
  class MarketplaceController < ApplicationController
    layout "welcome"

    def index
      @cars = Car.for_sale.paginate(page: params[:page], per_page: 50)
    end

    def show
      @car = Car.for_sale.find_by!(car_sell: { token: params[:token] })
      @markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true)
      respond_to do |format|
        format.turbo_stream
        format.html
      end
    end
  end
end
