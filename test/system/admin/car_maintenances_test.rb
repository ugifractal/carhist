require "application_system_test_case"

class CarMaintenancesTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers

  setup do
    # Set language
    I18n.locale = :id
  end

  test "visiting the index" do
    user = users(:admin)
    login_as user

    visit admin_car_maintenances_path
    assert_text "#{t('views.car_maintenances.title')}"
  end

  test "create car maintenance" do
    user = users(:admin)
    login_as user

    visit new_admin_car_maintenance_path
    sleep 1

    select "skyline", from: "car_maintenance_car_id"
    select "Oil Change", from: "car_maintenance_maintenance_type"
    fill_in "car_maintenance_title", with: "service oli"
    select "2024", from: "car_maintenance_performed_at_1i"
    select "January", from: "car_maintenance_performed_at_2i"
    select "1", from: "car_maintenance_performed_at_3i"
    fill_in "car_maintenance_description", with: "ganti oli rutin"
    select "auto200", from: "car_maintenance_car_shop"

    click_button "Create"
    sleep 1

    assert_text "service oli"
    assert_text "#{t('views.item.car_maintenance')} #{t('views.flash.notice_created')}."
  end
end
