require "application_system_test_case"

class AccountTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:sakib)
    login_as @user
  end

  test "user can update profile image" do
    visit edit_profiles_path
    assert_text "Edit Profile"
    sleep 1
    select "English", from: "user_language"
    attach_file "user_image", "#{Rails.root}/app/assets/images/candy.png"
    click_on "Update"
    sleep 1
    assert_text "Profil berhasil diupdate."
  end
end
