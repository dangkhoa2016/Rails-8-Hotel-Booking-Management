require "application_system_test_case"

class RoomsTest < ApplicationSystemTestCase
  setup do
    @room = rooms(:one)
  end

  test "visiting the index" do
    visit rooms_url
    assert_selector "h2", text: "Rooms"
  end

  test "should create room" do
    visit rooms_url
    click_on "New room"

    check "Available" if @room.available
    fill_in "Capacity", with: @room.capacity
    fill_in "Half day price afternoon", with: @room.half_day_price_afternoon
    fill_in "Half day price morning", with: @room.half_day_price_morning
    find("#room_hotel_location_id").find("option[value='#{@room.hotel_location_id}']").select_option
    fill_in "Name", with: @room.name + " new"
    fill_in "Price", with: @room.price
    find("#room_room_type_id").find("option[value='#{@room.room_type_id}']").select_option
    chk = find("#room_status")
    chk.click if chk.value != @room.status && chk.checked?
    fill_in "Summary", with: @room.summary
    click_on "Create Room"

    assert_text "Room was successfully created"
    click_on "Back", match: :first
  end

  test "should update Room" do
    visit room_url(@room)
    click_on "Edit", match: :first

    check "Available" if @room.available
    fill_in "Capacity", with: @room.capacity
    fill_in "Half day price afternoon", with: @room.half_day_price_afternoon
    fill_in "Half day price morning", with: @room.half_day_price_morning
    find("#room_hotel_location_id").find("option[value='#{@room.hotel_location_id}']").select_option
    fill_in "Name", with: @room.name + " updated"
    fill_in "Price", with: @room.price
    find("#room_room_type_id").find("option[value='#{@room.room_type_id}']").select_option
    chk = find("#room_status")
    chk.click if chk.value != @room.status && chk.checked?
    fill_in "Summary", with: @room.summary
    click_on "Update Room"

    assert_text "Room was successfully updated"
    click_on "Back", match: :first
  end

  test "should destroy Room" do
    visit room_url(@room)

    accept_alert do
      click_on "Delete", match: :first
    end

    assert_text "Room was successfully destroyed"
  end
end
