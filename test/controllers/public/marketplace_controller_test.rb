require "test_helper"

class Public::MarketplaceControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_marketplace_index_url
    assert_response :success
  end
end
