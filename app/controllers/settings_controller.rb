class SettingsController < ApplicationController
  before_action :set_setting

  def show
  end

  def destroy_api_key
    @setting.update(api_key: nil)
    redirect_to setting_path, notice: 'API key deleted successfully.'
  end

  private

  def set_setting
    @setting = current_user.setting
  end
end
