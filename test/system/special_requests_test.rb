require "application_system_test_case"

class SpecialRequestsTest < ApplicationSystemTestCase
  setup do
    @special_request = special_requests(:one)
  end

  test "visiting the index" do
    visit special_requests_url
    assert_selector "h1", text: "Special requests"
  end

  test "should create special request" do
    visit special_requests_url
    click_on "New special request"

    fill_in "Booking", with: @special_request.booking_id
    fill_in "Price", with: @special_request.price
    fill_in "Request", with: @special_request.request
    fill_in "Room reservation", with: @special_request.reservation_id
    click_on "Create Special request"

    assert_text "Special request was successfully created"
    click_on "Back"
  end

  test "should update Special request" do
    visit special_request_url(@special_request)
    click_on "Edit this special request", match: :first

    fill_in "Booking", with: @special_request.booking_id
    fill_in "Price", with: @special_request.price
    fill_in "Request", with: @special_request.request
    fill_in "Room reservation", with: @special_request.reservation_id
    click_on "Update Special request"

    assert_text "Special request was successfully updated"
    click_on "Back"
  end

  test "should destroy Special request" do
    visit special_request_url(@special_request)
    click_on "Destroy this special request", match: :first

    assert_text "Special request was successfully destroyed"
  end
end
