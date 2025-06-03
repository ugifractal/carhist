module Api
  module V1
    class CarsController < ApplicationController
      before_action :authenticate_api_key!

      def index
        cars = [
          { id: 1, name: 'captiva', brand: 'chevrolet' },
          { id: 2, name: 'trax', brand: 'chevrolet' }
        ]

        render json: { cars: cars }
      end

      private

      def authenticate_api_key!
        header_key = request.headers['api-key']
        unless ApiKey.exists?(key: header_key)
          render json: { error: 'Unauthorized. Invalid or missing API key.' }, status: :unauthorized
        end
      end

    end
  end
end
