require "application_system_test_case"

class PublicCarShopsTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers

  setup do
    # Set language
    I18n.locale = :id
  end

  test "visiting the index" do
    visit public_car_shops_url
    assert_text "Approved Car Shops"
  end

  test "visiting a car shop detail" do
    car_shop = car_shops(:approved)
    visit "/public/car_shops/#{car_shop.id}/#{car_shop.name}"
    sleep 1
    assert_text car_shop.name
  end
end
