module AiUtil
  class CarModelAi < GeminiCaller
    class << self
      def grab_car_spec(model:, year:)
        prompt = %Q(
          get some information about car with model #{model} #{year} for indonesia market build a json response without markdown formating with following fields:
          - width dimension as 'overall_width' in mm unit
          - length dimension as 'overall_length' in mm unit
          - height dimension as 'overall_height' in mm unit
          - wheelbase dimension as 'wheelbase' in mm unit
          - tank capacity dimension as 'tank_capacity' in litre unit
        )
        puts api_key
        request(prompt)
      end
    end
  end
end
