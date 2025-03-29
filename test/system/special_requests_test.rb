require "application_system_test_case"

class SpecialRequestsTest < ApplicationSystemTestCase
  setup do
    @special_request = special_requests(:one)
  end

  test "visiting the index" do
    visit special_requests_url
    assert_selector "h1", text: "Special Requests"
  end

  test "should create special request" do
    visit special_requests_url
    click_on "New special request"

    fill_in "Price", with: @special_request.price
    fill_in "Request", with: @special_request.request + " new"
    fill_in "Reservation", with: @special_request.reservation_id
    click_on "Create Special Request"

    assert_text "Special request was successfully created"
    click_on "Back"
  end

  test "should update Special request" do
    visit special_request_url(@special_request)
    click_on "Edit", match: :first

    fill_in "Price", with: @special_request.price
    fill_in "Request", with: @special_request.request + " updated"
    fill_in "Reservation", with: @special_request.reservation_id
    click_on "Update Special Request"

    assert_text "Special request was successfully updated"
    click_on "Back"
  end

  test "should destroy Special request" do
    visit special_request_url(@special_request)

    accept_alert do
      click_on "Delete", match: :first
    end

    assert_text "Special request was successfully destroyed"
  end
end
