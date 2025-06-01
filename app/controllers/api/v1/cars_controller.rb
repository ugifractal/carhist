module Api
  module V1
    class CarsController < ApplicationController
      def index
        cars = [
          { id: 1, name: 'captiva', brand: 'chevrolet' },
          { id: 2, name: 'trax', brand: 'chevrolet' }
        ]

        render json: { cars: cars }
      end
    end
  end
end
