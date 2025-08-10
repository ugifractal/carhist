require "application_system_test_case"

class CarsTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers

  test "visiting the index" do
    user = users(:admin)
    login_as user

    car_ = cars(:skyline)
    visit car_url
    sleep 1
    assert_text "Cars"
    assert_text "skyline"
  end

  test "create car" do
    user = users(:admin)
    login_as user

    car = cars(:skyline)

    visit new_admin_car_path
    sleep 1
    fill_in "nama", with: "Pajero"
    select "2024", from: "Year"
    select "skyline", from: I18n.t('views.cars.model')

    click_button "Create Car"

    assert_text "Car has been created!"
  end
end
