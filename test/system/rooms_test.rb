require "application_system_test_case"

class RoomsTest < ApplicationSystemTestCase
  setup do
    @room = rooms(:one)
  end

  test "visiting the index" do
    visit rooms_url
    assert_selector "h1", text: "Rooms"
  end

  test "should create room" do
    visit rooms_url
    click_on "New room"

    check "Available" if @room.available
    fill_in "Capacity", with: @room.capacity
    fill_in "Half day price afternoon", with: @room.half_day_price_afternoon
    fill_in "Half day price morning", with: @room.half_day_price_morning
    fill_in "Hotel location", with: @room.hotel_location_id
    fill_in "Name", with: @room.name + " new"
    fill_in "Price", with: @room.price
    fill_in "Room type", with: @room.room_type_id
    find("#room_status").find("option[value='#{@room.status}']").select_option
    fill_in "Summary", with: @room.summary
    click_on "Create Room"

    assert_text "Room was successfully created"
    click_on "Back"
  end

  test "should update Room" do
    visit room_url(@room)
    click_on "Edit this room", match: :first

    check "Available" if @room.available
    fill_in "Capacity", with: @room.capacity
    fill_in "Half day price afternoon", with: @room.half_day_price_afternoon
    fill_in "Half day price morning", with: @room.half_day_price_morning
    fill_in "Hotel location", with: @room.hotel_location_id
    fill_in "Name", with: @room.name + " updated"
    fill_in "Price", with: @room.price
    fill_in "Room type", with: @room.room_type_id
    find("#room_status").find("option[value='#{@room.status}']").select_option
    fill_in "Summary", with: @room.summary
    click_on "Update Room"

    assert_text "Room was successfully updated"
    click_on "Back"
  end

  test "should destroy Room" do
    visit room_url(@room)
    click_on "Destroy this room", match: :first

    assert_text "Room was successfully destroyed"
  end
end
