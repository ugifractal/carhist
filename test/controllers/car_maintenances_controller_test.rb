require "test_helper"

class CarMaintenancesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @car_maintenance = car_maintenances(:one)
  end

  test "should get index" do
    get car_maintenances_url
    assert_response :success
  end

  test "should get new" do
    get new_car_maintenance_url
    assert_response :success
  end

  test "should create car_maintenance" do
    assert_difference("CarMaintenance.count") do
      post car_maintenances_url, params: { car_maintenance: {} }
    end

    assert_redirected_to car_maintenance_url(CarMaintenance.last)
  end

  test "should show car_maintenance" do
    get car_maintenance_url(@car_maintenance)
    assert_response :success
  end

  test "should get edit" do
    get edit_car_maintenance_url(@car_maintenance)
    assert_response :success
  end

  test "should update car_maintenance" do
    patch car_maintenance_url(@car_maintenance), params: { car_maintenance: {} }
    assert_redirected_to car_maintenance_url(@car_maintenance)
  end

  test "should destroy car_maintenance" do
    assert_difference("CarMaintenance.count", -1) do
      delete car_maintenance_url(@car_maintenance)
    end

    assert_redirected_to car_maintenances_url
  end
end
