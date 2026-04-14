require "application_system_test_case"

class HomeTest < ApplicationSystemTestCase
  driven_by :rack_test

  test "guest users see the landing page" do
    sign_out(users(:three))

    visit root_url

    assert_selector "h1", text: "Quản lý Khách sạn Thông minh"
    assert_link "Đăng nhập ngay"
  end

  test "signed in users see the dashboard" do
    visit root_url

    assert_selector "h2", text: "Dashboard"
    assert_text "Chào mừng trở lại"
  end
end