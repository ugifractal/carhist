require "application_system_test_case"

class CarMaintenancesTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers

  setup do
    # Set language
    I18n.locale = :id
    user = users(:sakib)
    login_as user
  end

  test "list service history" do
    car_maintenance = car_maintenances(:history)
    visit car_car_maintenances_path(car_maintenance.car)
    sleep 1
    assert_text "Service Record dari"
  end

  test "create service" do
    car = cars(:skyline)

    visit "/cars/#{car.id}/car_maintenances/new"
    assert_text "Service Record Baru"
    sleep 1

    select "AC Repair", from: "car_maintenance_maintenance_type"
    fill_in "car_maintenance_title", with: "ganti oli"
    select "30", from: "car_maintenance_performed_at_3i"
    select "July", from: "car_maintenance_performed_at_2i"
    select "2022", from: "car_maintenance_performed_at_1i"
    fill_in "car_maintenance_description", with: "ini deskripsi"
    select "garuda", from: "car_maintenance_car_shop_id"
    click_button "Buat Service Record"
    sleep 1
    visit "/cars/#{car.id}/car_maintenances"
  end

  test "edit service" do
    car = cars(:skyline)
    car_maintenance = car_maintenances(:history)

    visit "/cars/#{car.id}/car_maintenances/#{car_maintenance.id}/edit"
    assert_text "Ubah Service Record"
    sleep 1

    select "AC Repair", from: "car_maintenance_maintenance_type"
    fill_in "car_maintenance_title", with: "ganti ban"
    select "12", from: "car_maintenance_performed_at_3i"
    select "June", from: "car_maintenance_performed_at_2i"
    select "2023", from: "car_maintenance_performed_at_1i"
    fill_in "car_maintenance_description", with: "ini edit deskripsi"
    select "garuda", from: "car_maintenance_car_shop_id"
    click_button "Update Service Record"
    sleep 1
    assert_text "#{t('views.item.car_maintenance')} #{t('views.flash.notice_updated')}."

    visit "/cars/#{car.id}/car_maintenances"
  end

  test "destroy service" do
    car = cars(:skyline)
    car_maintenance = car_maintenances(:history)

    visit "/cars/#{car.id}/car_maintenances"
    sleep 1

    accept_confirm do
      page.find("[data-turbo-confirm='Are you sure?']", match: :first).click
    end

    assert_text "#{t('views.item.car_maintenance')} #{t('views.flash.notice_deleted')}."
  end
end
