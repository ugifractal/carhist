require "application_system_test_case"

class CarModelsTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:admin)
    login_as @user
    @car_brand = car_brands(:suzuki)
    @car_model = car_models(:model)
  end

  test "visiting the index" do
    visit admin_car_models_url
    assert_text "Car models"
    assert_text @car_model.model
  end

  test "updating a Car model" do
    visit admin_car_models_url
    within("tr", text: @car_model.model) do
      click_on "Edit"
    end

    fill_in "Model", with: "Model Update"
    click_on "Update Car model"

    assert_text "Car model was successfully updated"
    assert_text "Model Update"
  end

  # test "destroying a Car model" do
  #   visit admin_car_models_url
  #   within("tr", text: @car_model.model) do
  #     click_on "Delete"
  #   end

  #   assert_text "Car model was successfully destroyed"
  # end
end
