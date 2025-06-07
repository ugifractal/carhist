module Api
  module V1
    class CarsController < ApplicationController
      before_action :authenticate_api_key!

      def index
        cars = Car.all
        render json: { cars: cars.as_json(only: [ :id, :name, :brand ]) }
      end

      private

      def authenticate_api_key!
        header_key = request.headers["api-key"]
        unless ApiKey.exists?(api_key: header_key)
          render json: { error: "Unauthorized. Invalid or missing API key." }, status: :unauthorized
        end
      end
    end
  end
end
