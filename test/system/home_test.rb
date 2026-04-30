require "application_system_test_case"

class HomeTest < ApplicationSystemTestCase
  driven_by :rack_test

  test "guest users see the landing page" do
    sign_out(users(:three))

    visit root_url

    assert_selector "h1", text: "Welcome to Rails 8Hotel Booking Management"
    assert_link "Login", href: new_user_session_path
  end
end
