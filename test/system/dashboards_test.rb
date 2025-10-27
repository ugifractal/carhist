require "application_system_test_case"

class DashboardsTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers

  setup do
    # Set language
    I18n.locale = :id
  end

  setup do
    user = users(:sakib)
    login_as user
    @company = user.company
  end

  test "user can view upgrade page and create order" do
    visit dashboards_path
    sleep 1

    assert_text "You are currently on free plan"
    click_on "Upgrade Plan"
    sleep 1

    visit new_company_order_path(@company)
    sleep 1

    assert_text "#{t('.upgrade')}."

    click_button t(".create_order")
    sleep 1

    assert_text "Access denied due to unauthorized transaction, please check client or server key"
  end
end
