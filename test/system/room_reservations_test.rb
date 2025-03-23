require "application_system_test_case"

class RoomReservationsTest < ApplicationSystemTestCase
  setup do
    @room_reservation = room_reservations(:one)
  end

  test "visiting the index" do
    visit room_reservations_url
    assert_selector "h1", text: "Room reservations"
  end

  test "should create room reservation" do
    visit room_reservations_url
    click_on "New room reservation"

    fill_in "Booking", with: @room_reservation.booking_id
    fill_in "Check in at", with: @room_reservation.check_in_at
    fill_in "Check out at", with: @room_reservation.check_out_at
    fill_in "Note", with: @room_reservation.note
    fill_in "Quantity", with: @room_reservation.quantity
    fill_in "Room", with: @room_reservation.room_id
    fill_in "Status", with: @room_reservation.status
    fill_in "Total price", with: @room_reservation.total_price
    click_on "Create Room reservation"

    assert_text "Room reservation was successfully created"
    click_on "Back"
  end

  test "should update Room reservation" do
    visit room_reservation_url(@room_reservation)
    click_on "Edit this room reservation", match: :first

    fill_in "Booking", with: @room_reservation.booking_id
    fill_in "Check in at", with: @room_reservation.check_in_at.to_s
    fill_in "Check out at", with: @room_reservation.check_out_at.to_s
    fill_in "Note", with: @room_reservation.note
    fill_in "Quantity", with: @room_reservation.quantity
    fill_in "Room", with: @room_reservation.room_id
    fill_in "Status", with: @room_reservation.status
    fill_in "Total price", with: @room_reservation.total_price
    click_on "Update Room reservation"

    assert_text "Room reservation was successfully updated"
    click_on "Back"
  end

  test "should destroy Room reservation" do
    visit room_reservation_url(@room_reservation)
    click_on "Destroy this room reservation", match: :first

    assert_text "Room reservation was successfully destroyed"
  end
end
