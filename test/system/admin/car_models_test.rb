require "application_system_test_case"

class CarModelsTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:admin)
    login_as @user
    @car_brand = car_brands(:suzuki)
    @car_model = car_models(:escudo)
  end

  test "visiting the index" do
    visit admin_car_models_url
    assert_text "Your Car Models"
    assert_text @car_model.model
  end

  test "create model" do
    user = users(:admin)
    login_as user

    car_model = car_models(:escudo)

    visit new_admin_car_model_path(car_model)
    sleep 1
    select "suzuki", from: "Brand"
    fill_in "Model", with: "Pajero"
    fill_in "Year", with: 2030
    fill_in "Overall width", with: 2000
    fill_in "Overall height", with: 2000
    fill_in "Overall length", with: 2000
    fill_in "Wheelbase", with: 2000
    fill_in "Tank capacity", with: 2000
    click_button "Create"
    sleep 1
    assert_text "Car Model Successfully Created."
  end

  test "edit model" do
    user = users(:admin)
    login_as user

    car_model = car_models(:escudo)

    visit edit_admin_car_model_path(car_model)
    sleep 1
    select "suzuki", from: "Brand"
    fill_in "Model", with: "Brio"
    fill_in "Year", with: 2025
    fill_in "Overall width", with: 1800
    fill_in "Overall height", with: 1400
    fill_in "Overall length", with: 3800
    fill_in "Wheelbase", with: 2500
    fill_in "Tank capacity", with: 50
    click_button "Update"
    sleep 1
    assert_text "Car Model Successfully Updated."
  end

  test "destroy" do
    user = users(:admin)
    login_as user

    car_model = car_models(:escudo)

    visit admin_car_models_url
    sleep 1

    accept_confirm do
      page.find(:xpath, "//tbody/tr[position()=1]/td[position()=5]/*/button[@title='Delete']").click
    end
    sleep 1
    assert_text "Car Model Successfully deleted."
  end
end
