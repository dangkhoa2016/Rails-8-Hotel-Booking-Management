require "application_system_test_case"

class RoomTypesTest < ApplicationSystemTestCase
  setup do
    @room_type = room_types(:one)
  end

  test "visiting the index" do
    visit room_types_url
    assert_selector "h2", text: "Room Types"
  end

  test "should create room type" do
    visit room_types_url
    click_on "New room type"

    fill_in "Color", with: @room_type.color
    fill_in "Name", with: @room_type.name + " new"
    chk = find("#room_type_status")
    chk.click if chk.value != @room_type.status && chk.checked?
    fill_in "Summary", with: @room_type.summary
    click_on "Create Room Type"

    assert_text "Room type was successfully created"
    click_on "Back", match: :first
  end

  test "should update Room type" do
    visit room_type_url(@room_type)
    click_on "Edit", match: :first

    fill_in "Color", with: @room_type.color
    fill_in "Name", with: @room_type.name + " updated"
    chk = find("#room_type_status")
    chk.click if chk.value != @room_type.status && chk.checked?
    fill_in "Summary", with: @room_type.summary
    click_on "Update Room Type"

    assert_text "Room type was successfully updated"
    click_on "Back", match: :first
  end

  test "should destroy Room type" do
    visit room_type_url(@room_type)

    accept_alert do
      click_on "Delete", match: :first
    end

    assert_text "Room type was successfully destroyed"
  end
end
