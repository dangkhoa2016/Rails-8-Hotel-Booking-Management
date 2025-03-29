require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  setup do
    @user = users(:two)
    sign_in users(:one)
  end

  test "visiting the index" do
    visit users_url
    assert_selector "h1", text: "Users"
  end

  test "should create user" do
    visit users_url
    click_on "New user"

    fill_in "Email", with: @user.email + ".test"
    fill_in "Password", with: "password"
    fill_in "Full name", with: @user.full_name
    find("#user_role").find("option[value='#{@user.role}']").select_option
    chk = find("#user_status")
    chk.click if chk.value != @user.status && chk.checked?
    click_on "Create User"

    assert_text "User was successfully created."
    click_on "Back"
  end

  test "should update User" do
    visit user_url(@user)
    click_on "Edit", match: :first

    fill_in "Email", with: @user.email + ".test"
    fill_in "Password", with: "password"
    fill_in "Full name", with: @user.full_name
    find("#user_role").find("option[value='#{@user.role}']").select_option
    chk = find("#user_status")
    chk.click if chk.value != @user.status && chk.checked?
    click_on "Update User"

    assert_text "User was successfully updated."
    click_on "Back"
  end

  test "should destroy User" do
    visit user_url(@user)

    accept_alert do
      click_on "Delete", match: :first
    end

    assert_text "User was successfully destroyed"
  end
end
