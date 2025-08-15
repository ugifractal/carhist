require "application_system_test_case"

class CarShopsTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers

  test "visiting the index" do
    car_shop = car_shops(:auto200)
    visit public_car_shops_url
    sleep 1
    assert_text "Approved Car Shops"
  end

  test "create shop" do
    visit public_car_shop_url
    sleep 1

    fill_in "car_shop_name", with: "Test Shop"
    select "Tire Shop", from: "car_shop_category"
    fill_in "car_shop_description", with: "This is a test description"
    fill_in "car_shop_lat", with: "-6.200000"
    fill_in "car_shop_lng", with: "106.816666"
    select "garuda", from: "car_shop_company_id"
    click_button "Create"
    sleep 1
    assert_text "Car shop successfully created."
  end
end
