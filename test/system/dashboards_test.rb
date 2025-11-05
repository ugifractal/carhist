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
end
