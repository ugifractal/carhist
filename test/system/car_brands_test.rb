require "application_system_test_case"

class CarBrandsTest < ApplicationSystemTestCase
  setup do
    @car_brand = car_brands(:one)
  end

  test "visiting the index" do
    visit car_brands_url
    assert_selector "h1", text: "Car brands"
  end

  test "should create car brand" do
    visit car_brands_url
    click_on "New car brand"

    click_on "Create Car brand"

    assert_text "Car brand was successfully created"
    click_on "Back"
  end

  test "should update Car brand" do
    visit car_brand_url(@car_brand)
    click_on "Edit this car brand", match: :first

    click_on "Update Car brand"

    assert_text "Car brand was successfully updated"
    click_on "Back"
  end

  test "should destroy Car brand" do
    visit car_brand_url(@car_brand)
    click_on "Destroy this car brand", match: :first

    assert_text "Car brand was successfully destroyed"
  end
end
