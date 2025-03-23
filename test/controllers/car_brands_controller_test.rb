require "test_helper"

class CarBrandsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @car_brand = car_brands(:one)
  end

  test "should get index" do
    get car_brands_url
    assert_response :success
  end

  test "should get new" do
    get new_car_brand_url
    assert_response :success
  end

  test "should create car_brand" do
    assert_difference("CarBrand.count") do
      post car_brands_url, params: { car_brand: {} }
    end

    assert_redirected_to car_brand_url(CarBrand.last)
  end

  test "should show car_brand" do
    get car_brand_url(@car_brand)
    assert_response :success
  end

  test "should get edit" do
    get edit_car_brand_url(@car_brand)
    assert_response :success
  end

  test "should update car_brand" do
    patch car_brand_url(@car_brand), params: { car_brand: {} }
    assert_redirected_to car_brand_url(@car_brand)
  end

  test "should destroy car_brand" do
    assert_difference("CarBrand.count", -1) do
      delete car_brand_url(@car_brand)
    end

    assert_redirected_to car_brands_url
  end
end
