class ApiKeysController < ApplicationController
  before_action :authenticate_user!

  def new
    if current_user.api_key
      redirect_to settings_path, alert: "You already have an API key."
    else
      @api_key = ApiKey.new
    end
  end

  def create
    if current_user.api_key
      redirect_to settings_path, alert: "You can only create one API key."
    else
      @api_key = current_user.build_api_key(api_key_params)
      if @api_key.save
        redirect_to settings_path, notice: "API key created successfully."
      else
        render :new
      end
    end
  end

  private

  def api_key_params
    params.require(:api_key).permit(:name)
  end
end
