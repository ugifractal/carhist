require "test_helper"

class MaintenanceSettingsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get maintenance_settings_show_url
    assert_response :success
  end
end
