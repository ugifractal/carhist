require "application_system_test_case"

class CarShopsTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers

  setup do
    # Set language
    I18n.locale = :id
  end
  
  test "visiting index" do
    user = users(:sakib)
    login_as user

    car_shop = car_shops(:auto200)
    visit car_shops_url
    sleep 1
    assert_text "Your Car Shops"
  end

  test "new shop" do
    user = users(:sakib)
    login_as user

    visit new_car_shop_url
    sleep 1

    fill_in "car_shop_name", with: "Test Shop"
    select "Tire Shop", from: "car_shop_category"
    fill_in "car_shop_description", with: "This is a test description"
    click_button "Create"
    sleep 1
    assert_text "#{t('views.item.car_shop')} #{t('views.flash.notice_created')}."
  end

  test "update shop" do
    user = users(:sakib)
    login_as user

    car_shop = car_shops(:auto200)

    visit edit_car_shop_path(car_shop)
    sleep 1
    fill_in "car_shop_name", with: "Yamaha"
    select "Ecu Shop", from: "car_shop_category"
    fill_in "car_shop_description", with: "This is a Yamaha"
    click_button "Update"
    sleep 1
    assert_text "#{t('views.item.car_shop')} #{t('views.flash.notice_updated')}."
  end

  test "destroy shop" do
    user = users(:sakib)
    login_as user

    car_shop = car_shops(:auto200)

    visit car_shops_url
    sleep 1

    accept_confirm do
      page.find("[data-turbo-confirm='Are you sure?']", match: :first).click
    end
    sleep 1
    assert_text "#{t('views.item.car_shop')} #{t('views.flash.notice_deleted')}."
  end
end
