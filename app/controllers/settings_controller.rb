class SettingsController < ApplicationController
  before_action :authenticate_user!

  def show
  end

  def destroy_api_key
    current_user.api_key&.destroy
    redirect_to settings_path, notice: "API key deleted."
  end
end
