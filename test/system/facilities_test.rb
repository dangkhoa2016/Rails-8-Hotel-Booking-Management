require "application_system_test_case"

class FacilitiesTest < ApplicationSystemTestCase
  setup do
    @facility = facilities(:one)
  end

  test "visiting the index" do
    visit facilities_url
    assert_selector "h2", text: "Facilities"
  end

  test "should create facility" do
    visit facilities_url
    click_on "New facility"

    fill_in "Name", with: @facility.name + " new"
    chk = find("#facility_status")
    chk.click if chk.value != @facility.status && chk.checked?
    fill_in "Summary", with: @facility.summary
    click_on "Create Facility"

    assert_text "Facility was successfully created"
    click_on "Back", match: :first
  end

  test "should update Facility" do
    visit facility_url(@facility)
    click_on "Edit", match: :first

    fill_in "Name", with: @facility.name + " updated"
    chk = find("#facility_status")
    chk.click if chk.value != @facility.status && chk.checked?
    fill_in "Summary", with: @facility.summary
    click_on "Update Facility"

    assert_text "Facility was successfully updated"
    click_on "Back", match: :first
  end

  test "should destroy Facility" do
    visit facility_url(@facility)

    accept_alert do
      click_on "Delete", match: :first
    end

    assert_text "Facility was successfully destroyed"
  end
end
