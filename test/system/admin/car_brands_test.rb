require "application_system_test_case"

class CarBrandsTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers

  test "visiting the index" do
    user = users(:admin)
    login_as user

    car_brand = car_brands(:suzuki)
    visit admin_car_brands_url
    sleep 1
    assert_text "Car brands"
    assert_text "suzuki"
  end

  test "create brand" do
    user = users(:admin)
    login_as user

    visit new_admin_car_brand_url
    sleep 1
    fill_in :car_brand_name, with: "chevrolet"
    click_button "Create Car brand"
    sleep 1
    assert_text "Car Brand was successfully created."
  end

  test "edit brand" do
    user = users(:admin)
    login_as user

    car_brand = car_brands(:suzuki)

    visit edit_admin_car_brand_path(car_brand)
    sleep 1
    fill_in :car_brand_name, with: "Audi"
    click_button "Update Car brand"
    sleep 1
    assert_text "Car Brand was successfully updated."
  end

  test "destroy" do
    user = users(:admin)
    login_as user

    car_brand = car_brands(:suzuki)

    visit admin_car_brands_path
    sleep 1

    accept_confirm do
      page.find(:xpath, "//tbody/tr[position()=1]/td[position()=3]/*/button[@title='Delete']").click
    end

    assert_text "Car Brand was successfully deleted."
  end
end
