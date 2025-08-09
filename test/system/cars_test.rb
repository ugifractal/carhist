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
    assert_text "suzuki"
  end

  test "create car" do
    user = users(:admin)
    login_as user

    visit new_admin_car_url
    sleep 1
    fill_in :car_name, with: "chevrolet"
    click_button "Create Car"
    sleep 1
    assert_text "Car has been created!"
  end

  test "edit car" do
    user = users(:admin)
    login_as user

    car = cars(:suzuki)

    visit edit_admin_car_path(car)
    sleep 1
    fill_in :car_name, with: "Audi"
    click_button "Update Car brand"
    sleep 1
    assert_text "Car brand was successfully updated."
  end

  test "destroy" do
    user = users(:admin)
    login_as user

    car = cars(:suzuki)

    visit admin_cars_path
    sleep 1

    accept_confirm do
      page.find(:xpath, "//tbody/tr[position()=1]/td[position()=3]/*/button[@title='Delete']").click
    end

    assert_text "Car brand was successfully destroyed."
  end
end
