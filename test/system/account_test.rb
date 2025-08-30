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

  test "user can update profile image" do
    visit edit_profile_path

    attach_file "user[image]", "#{Rails.root.to_s}/public/contoh.png"

    click_on "Update Profile"
    assert_text "Profile berhasil diperbarui"
    assert_selector "img[src*='contoh.png']", wait: 5
  en
end
