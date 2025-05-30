require "application_system_test_case"

class ReservationsTest < ApplicationSystemTestCase
  setup do
    @reservation = reservations(:one)
    @room2 = rooms(:two)
  end

  test "visiting the index" do
    visit reservations_url
    assert_selector "h2", text: "Reservations"
  end

  test "should create reservation" do
    visit reservations_url
    click_on "New reservation"

    find("#reservation_booking_id").find("option[value='#{@reservation.booking_id}']").select_option
    fill_in "Check in at", with: @reservation.check_in_at
    fill_in "Check out at", with: @reservation.check_out_at
    fill_in "Note", with: @reservation.note
    find("#reservation_room_id").find("option[value='#{@room2.id}']").select_option
    fill_in "Room occupant", with: @reservation.room_occupant
    fill_in "Room price", with: @reservation.room_price
    fill_in "Total price", with: @reservation.total_price
    find("#reservation_status").find("option[value='#{@reservation.status}']").select_option
    click_on "Create Reservation"

    assert_text "Reservation was successfully created"
    click_on "Back", match: :first
  end

  test "should update Reservation" do
    visit reservation_url(@reservation)
    click_on "Edit", match: :first

    find("#reservation_booking_id").find("option[value='#{@reservation.booking_id}']").select_option
    fill_in "Check in at", with: @reservation.check_in_at
    fill_in "Check out at", with: @reservation.check_out_at
    fill_in "Note", with: @reservation.note
    find("#reservation_room_id").find("option[value='#{@room2.id}']").select_option
    fill_in "Room occupant", with: @reservation.room_occupant
    fill_in "Room price", with: @reservation.room_price
    fill_in "Total price", with: @reservation.total_price
    find("#reservation_status").find("option[value='#{@reservation.status}']").select_option
    click_on "Update Reservation"

    assert_text "Reservation was successfully updated"
    click_on "Back", match: :first
  end

  test "should destroy Reservation" do
    visit reservation_url(@reservation)

    accept_alert do
      click_on "Delete", match: :first
    end

    assert_text "Reservation was successfully destroyed"
  end
end
