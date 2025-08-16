# require "application_system_test_case"

# class CarsTest < ApplicationSystemTestCase
#   include Devise::Test::IntegrationHelpers

#   test "visiting the index" do
#     user = users(:sakib)
#     login_as user

#     car = cars(:skyline)

#     visit cars_url
#     sleep 1
#     assert_text "Daftar Mobil"
#     assert_text "skyline"
#   end

#   test "create car" do
#     user = users(:sakib)
#     login_as user

#     car = cars(:skyline)
#     model = car_models(:escudo)

#     visit new_car_path(car)
#     sleep 1

#     fill_in "car_name", with: "Pajero"
#     select "2024", from: "car_year"
#     select "suzuki Escudo", from: "car_car_model_id"
#     click_button "Tambah"
#     sleep 1
#     assert_text "Car was successfully created."
#   end

#   test "edit car" do
#     user = users(:sakib)
#     login_as user

#     car = cars(:skyline)
#     model = car_models(:escudo)

#     visit edit_car_path(car)
#     sleep 1

#     fill_in "car_name", with: "avanza"
#     select "2021", from: "car_year"
#     select "nissan skyline", from: "car_car_model_id"
#     click_button "Update"
#     sleep 1
#     assert_text "Car was successfully updated."
#   end

#   test "destroy" do
#     user = users(:sakib)
#     login_as user

#     car = cars(:skyline)

#     visit cars_path
#     sleep 1

#     accept_confirm do
#       page.find(:xpath, "//tbody/tr[1]//button[@data-turbo-confirm='Are you sure?']").click
#     end

#     assert_text "Car was successfully destroyed."
#   end
# end
