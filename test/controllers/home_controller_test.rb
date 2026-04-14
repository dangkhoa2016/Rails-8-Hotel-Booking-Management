require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "guest users can access the landing page" do
    get root_url
    assert_response :success
    assert_includes @response.body, new_user_session_path
  end

  test "signed in users can access the dashboard" do
    sign_in users(:one)

    get root_url

    assert_response :success
    assert_includes @response.body, "Dashboard"
  end
end
