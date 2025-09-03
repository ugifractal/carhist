require "application_system_test_case"

class AccountTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers

  setup do
    # Set language
    I18n.locale = :id
  end

  test "open edit user from right menu" do
    user = users(:sakib)
    login_as user
    visit dashboards_path
    sleep 1

    page.find(:xpath, "//div[@data-btn='right-top-menu']").click
    page.find(:xpath, "//a[contains(text(), '#{user.email}')]").click
    sleep 1
    assert_text "Edit Profile"
  end
end
