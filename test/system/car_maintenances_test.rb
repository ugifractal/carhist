require "application_system_test_case"

class CarMaintenancesTest < ApplicationSystemTestCase
  setup do
    @car_maintenance = car_maintenances(:one)
  end

  test "visiting the index" do
    visit car_maintenances_url
    assert_selector "h1", text: "Car maintenances"
  end

  test "should create car maintenance" do
    visit car_maintenances_url
    click_on "New car maintenance"

    click_on "Create Car maintenance"

    assert_text "Car maintenance was successfully created"
    click_on "Back"
  end

  test "should update Car maintenance" do
    visit car_maintenance_url(@car_maintenance)
    click_on "Edit this car maintenance", match: :first

    click_on "Update Car maintenance"

    assert_text "Car maintenance was successfully updated"
    click_on "Back"
  end

  test "should destroy Car maintenance" do
    visit car_maintenance_url(@car_maintenance)
    accept_confirm { click_on "Destroy this car maintenance", match: :first }

    assert_text "Car maintenance was successfully destroyed"
  end
end
