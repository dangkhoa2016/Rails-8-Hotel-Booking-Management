require "test_helper"

class RateLimitTest < ActionDispatch::IntegrationTest
  test "sign in rate limit works" do
    # Limit is 5 per minute
    6.times do
      post user_session_path, params: { user: { email: "test@example.com", password: "password" } }
    end
    assert_redirected_to new_user_session_path
    follow_redirect!
    assert_match I18n.t("devise.failure.rate_limited_sign_in"), response.body
  end

  test "sign up rate limit works" do
    # Limit is 3 per hour
    4.times do
      post user_registration_path, params: { user: { email: "new@example.com", password: "password", password_confirmation: "password", full_name: "New User" } }
    end
    assert_redirected_to new_user_registration_path
    follow_redirect!
    assert_match I18n.t("devise.failure.rate_limited_sign_up"), response.body
  end
end
