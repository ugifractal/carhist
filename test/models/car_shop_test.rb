require "test_helper"

class CarShopTest < ActiveSupport::TestCase
  test "Pending" do
    car_shop = car_shops(:one)
    assert_nil CarShop.pending.first.approved_at
  end

  test "approved" do

  end
end
