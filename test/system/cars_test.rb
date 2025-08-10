require "application_system_test_case"

class CarsTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers

  test "visiting the index" do
    user = users(:admin)
    login_as user

    car_ = cars(:suzuki)
    visit admin_car_brans_url
    sleep 1
    assert_text "Cars"
    assert_text "skyline"
  end

  test "create car" do
    user = users(:admin)
    login_as user

    visit new_car_url
    sleep 1
    fill_in "Model", with: "Honda"
    select "2024", from: "year"
    select "skyline", from: "t('views.cars.model')"
    click_button "Create Car"
    sleep 1
    assert_text "Car has been created!"
  end
end
