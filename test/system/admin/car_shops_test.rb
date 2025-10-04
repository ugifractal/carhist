require "application_system_test_case"

class CarShopsTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers

  test "visiting the index" do
    user = users(:admin)
    login_as user

    car_shop = car_shops(:auto200)
    visit admin_car_shops_url
    sleep 1
    assert_text "Your Car Shops"
  end

  test "create shop" do
    user = users(:admin)
    login_as user

    visit new_admin_car_shop_url
    sleep 1

    fill_in "car_shop_name", with: "Test Shop"
    select "Tire Shop", from: "car_shop_category"
    fill_in "car_shop_description", with: "This is a test description"
    fill_in "car_shop_lat", with: "-6.200000"
    fill_in "car_shop_lng", with: "106.816666"
    select "garuda", from: "car_shop_company_id"
    click_button "Create"
    sleep 1
    assert_text "Car Shop was successfully."
  end

  test "edit shop" do
    user = users(:admin)
    login_as user

    car_shop = car_shops(:auto200)

    visit edit_admin_car_shop_path(car_shop)
    sleep 1
    fill_in "car_shop_name", with: "Yamaha"
    select "Ecu Shop", from: "car_shop_category"
    fill_in "car_shop_description", with: "This is a Yamaha"
    fill_in "car_shop_lat", with: "-7.200000"
    fill_in "car_shop_lng", with: "156.816666"
    select "garuda", from: "car_shop_company_id"
    click_button "Update"
    sleep 1
    assert_text "Car Shop was successfully updated."
  end

  test "destroy" do
    user = users(:admin)
    login_as user

    car_model = car_shops(:auto200)

    visit admin_car_shops_url
    sleep 1

    accept_confirm do
      page.find(:xpath, "//tbody/tr[1]//button[@data-turbo-confirm='Are you sure?']").click
    end
    sleep 1
    assert_text "Car Shop was successfully deleted."
  end
end
