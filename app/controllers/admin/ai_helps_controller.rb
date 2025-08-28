module Admin
  class AiHelpsController < AdminBaseController
    def car_spec
      data = JSON.parse(request.body.read)
      AiUtil::GeminiCaller.setup(ENV.fetch("GEMINI_API_KEY"))
      response = AiUtil::CarModelAi.grab_car_spec(model: data["model"], year: data["year"])

      render json: { output: response[:text] }
    end
  end
end
