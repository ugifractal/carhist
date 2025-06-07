module Api
  module V1
    class CarsController < ApplicationController
      before_action :authenticate_api_key!

      def index
        cars = @api_key.user.cars
        render json: { cars: cars.as_json(only: [ :id, :name, :brand ]) }
      end

      private

      def authenticate_api_key!
        header_key = request.headers["api-key"]
        if ApiKey.exists?(api_key: header_key)
          @api_key = ApiKey.find_by(api_key: header_key)
        else
          render json: { error: "Unauthorized. Invalid or missing API key." }, status: :unauthorized
        end
      end
    end
  end
end
