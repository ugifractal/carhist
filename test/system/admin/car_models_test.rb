require "application_system_test_case"

class CarModelsTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers

  test "visiting the index" do
    user = users(:admin)
    login_as user

    car_model = car_models(:suzuki)
    visit admin_car_models_url
    sleep 1
    assert_text "Car models"
    assert_text "suzuki"
  end

  test "create model" do
    user = users(:admin)
    login_as user

    visit new_admin_car_model_url
    sleep 1
    fill_in :car_model_name, with: "chevrolet"
    click_button "Create Car model"
    sleep 1
    assert_text "Car model has been created!"
  end

  test "edit model" do
    user = users(:admin)
    login_as user

    car_model = car_models(:suzuki)

    visit edit_admin_car_model_path(car_model)
    sleep 1
    fill_in :car_model_name, with: "Audi"
    click_button "Update Car model"
    sleep 1
    assert_text "Car model was successfully updated."
  end

  test "destroy" do
    user = users(:admin)
    login_as user

    car_model = car_models(:suzuki)

    visit admin_car_models_path
    sleep 1

    within("tr", text: car_model.name) do
      click_button "Delete"
    end

    sleep 1
    assert_text "Car model was successfully destroyed."
  end
end
