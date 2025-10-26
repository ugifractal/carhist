require "application_system_test_case"

class AccountTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers

  setup do
    # Set language
    I18n.locale = :id
  end

  setup do
    user = users(:sakib)
    login_as user
  end

  test "index" do
    visit dashboards_path
    assert_text "You are currently on free plan"
    sleep 1

    click_on "Upgrade Plan"
    sleep 1
    assert_text "Upgrade"
  end
end
