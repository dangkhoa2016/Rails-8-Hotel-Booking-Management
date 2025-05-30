require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:two)
    sign_in users(:one)
  end

  test "should get index" do
    get users_url
    assert_response :success
  end

  test "should get new" do
    get new_user_url
    assert_response :success
  end

  test "should create user" do
    assert_difference("User.count") do
      post create_users_url, params: { user: {
        email: @user.email + ".test", password: "password", full_name: @user.full_name,
        role: @user.role, status: @user.status
      }
    }
    end

    assert_redirected_to user_url(User.reorder(id: :desc).first)
  end

  test "should show user" do
    get user_url(@user)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_url(@user)
    assert_response :success
  end

  test "should update user" do
    patch user_url(@user), params: { user: {
        email: @user.email + ".test", password: "password", full_name: @user.full_name,
        role: @user.role, status: @user.status
      }
    }
    assert_redirected_to user_url(@user)
  end

  test "should destroy user" do
    assert_difference("User.count", -1) do
      delete user_url(@user)
    end

    assert_redirected_to users_url
  end
end
