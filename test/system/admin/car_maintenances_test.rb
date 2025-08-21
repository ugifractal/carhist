require "application_system_test_case"

class CarMaintenancesTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers

  setup do
    # Set language
    I18n.locale = :id
  end

  test "visiting the index" do
    user = users(:admin)
    login_as user

    visit admin_car_maintenances_url
    assert_text "#{t('views.car_maintenances.title')}"
  end
end
