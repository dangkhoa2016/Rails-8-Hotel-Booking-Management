require "application_system_test_case"

class HotelLocationsTest < ApplicationSystemTestCase
  setup do
    @hotel_location = hotel_locations(:one)
  end

  test "visiting the index" do
    visit hotel_locations_url
    assert_selector "h1", text: "Hotel Locations"
  end

  test "should create hotel location" do
    visit hotel_locations_url
    click_on "New hotel location"

    fill_in "Address", with: @hotel_location.address + " new"
    fill_in "Manager name", with: @hotel_location.manager_name
    fill_in "Name", with: @hotel_location.name + " new"
    find("#hotel_location_status").find("option[value='#{@hotel_location.status}']").select_option
    click_on "Create Hotel Location"

    assert_text "Hotel location was successfully created"
    click_on "Back"
  end

  test "should update Hotel location" do
    visit hotel_location_url(@hotel_location)
    click_on "Edit this hotel location", match: :first

    fill_in "Address", with: @hotel_location.address + " updated"
    fill_in "Manager name", with: @hotel_location.manager_name
    fill_in "Name", with: @hotel_location.name + " updated"
    find("#hotel_location_status").find("option[value='#{@hotel_location.status}']").select_option
    click_on "Update Hotel Location"

    assert_text "Hotel location was successfully updated"
    click_on "Back"
  end

  test "should destroy Hotel location" do
    visit hotel_location_url(@hotel_location)
    click_on "Destroy this hotel location", match: :first

    assert_text "Hotel location was successfully destroyed"
  end
end
