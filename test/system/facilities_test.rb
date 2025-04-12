require "application_system_test_case"

class FacilitiesTest < ApplicationSystemTestCase
  setup do
    @facility = facilities(:one)
  end

  test "visiting the index" do
    visit facilities_url
    assert_selector "h1", text: "Facilities"
  end

  test "should create facility" do
    visit facilities_url
    click_on "New facility"

    fill_in "Name", with: @facility.name + " new"
    find("#facility_status").find("option[value='#{@facility.status}']").select_option
    fill_in "Summary", with: @facility.summary
    click_on "Create Facility"

    assert_text "Facility was successfully created"
    click_on "Back"
  end

  test "should update Facility" do
    visit facility_url(@facility)
    click_on "Edit this facility", match: :first

    fill_in "Name", with: @facility.name + " updated"
    find("#facility_status").find("option[value='#{@facility.status}']").select_option
    fill_in "Summary", with: @facility.summary
    click_on "Update Facility"

    assert_text "Facility was successfully updated"
    click_on "Back"
  end

  test "should destroy Facility" do
    visit facility_url(@facility)
    click_on "Destroy this facility", match: :first

    assert_text "Facility was successfully destroyed"
  end
end
