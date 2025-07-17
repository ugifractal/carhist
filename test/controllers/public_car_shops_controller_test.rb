require "test_helper"

class PublicCarShopsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get public_car_shops_show_url
    assert_response :success
  end
end
