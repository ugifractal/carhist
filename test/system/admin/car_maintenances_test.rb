require "application_system_test_case"

class CarMaintenancesTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers

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
    select "auto200", from: "car_maintenance_car_shop_id"

    click_button "#{t('views.cars.create')}"
    sleep 1

    assert_text "service oli"
    assert_text "#{t('views.item.car_maintenance')} #{t('views.flash.notice_created')}."
  end

  test "edit car maintenance" do
    user = users(:admin)
    login_as user

    car_maintenance = car_maintenances(:history)

    visit edit_admin_car_maintenance_path(car_maintenance)
    sleep 1

    select "skyline", from: "car_maintenance_car_id"
    select "Oil Change", from: "car_maintenance_maintenance_type"
    fill_in "car_maintenance_title", with: "service oli rutin"
    select "2022", from: "car_maintenance_performed_at_1i"
    select "July", from: "car_maintenance_performed_at_2i"
    select "2", from: "car_maintenance_performed_at_3i"
    fill_in "car_maintenance_description", with: "ganti oli mesin rutin"
    select "auto200", from: "car_maintenance_car_shop_id"

    click_button "Update"
    sleep 1

    assert_text "service oli"
    assert_text "#{t('views.item.car_maintenance')} #{t('views.flash.notice_updated')}."
  end

  test "destroy" do
    user = users(:admin)
    login_as user

    car_maintenance = car_maintenances(:history)

    visit admin_car_maintenances_path
    sleep 1

    accept_confirm do
      page.find(:xpath, "//tbody/tr[1]//button[@data-turbo-confirm='Are you sure?']").click
    end

    assert_text "#{t('views.item.car_maintenance')} #{t('views.flash.notice_deleted')}."
  end
end
