require "application_system_test_case"

class CarShopsTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers

  test "visiting the index" do
    user = users(:admin)
    login_as user

    car_shop = car_shops(:suzuki)
    visit admin_car_shops_url
    sleep 1
    assert_text "Car shops"
    assert_text "suzuki"
  end

  test "create shop" do
    user = users(:admin)
    login_as user

    visit new_admin_car_shop_url
    sleep 1
    fill_in :car_shop_name, with: "chevrolet"
    click_button "Create Car shop"
    sleep 1
    assert_text "Car shop has been created!"
  end

  test "edit shop" do
    user = users(:admin)
    login_as user

    car_shop = car_shops(:suzuki)

    visit edit_admin_car_shop_path(car_shop)
    sleep 1
    fill_in :car_shop_name, with: "Audi"
    click_button "Update Car shop"
    sleep 1
    assert_text "Car shop was successfully updated."
  end

  test "destroy" do
    user = users(:admin)
    login_as user

    car_shop = car_shops(:suzuki)

    visit admin_car_shops_path
    sleep 1

    accept_confirm do
      page.find(:xpath, "//tbody/tr[position()=1]/td[position()=3]/*/button[@title='Delete']").click
    end

    assert_text "Car shop was successfully destroyed."
  end
end
