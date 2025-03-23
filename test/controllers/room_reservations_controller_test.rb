require "test_helper"

class RoomReservationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @room_reservation = room_reservations(:one)
  end

  test "should get index" do
    get room_reservations_url
    assert_response :success
  end

  test "should get new" do
    get new_room_reservation_url
    assert_response :success
  end

  test "should create room_reservation" do
    assert_difference("RoomReservation.count") do
      post room_reservations_url, params: { room_reservation: { booking_id: @room_reservation.booking_id, check_in_at: @room_reservation.check_in_at, check_out_at: @room_reservation.check_out_at, note: @room_reservation.note, quantity: @room_reservation.quantity, room_id: @room_reservation.room_id, status: @room_reservation.status, total_price: @room_reservation.total_price } }
    end

    assert_redirected_to room_reservation_url(RoomReservation.last)
  end

  test "should show room_reservation" do
    get room_reservation_url(@room_reservation)
    assert_response :success
  end

  test "should get edit" do
    get edit_room_reservation_url(@room_reservation)
    assert_response :success
  end

  test "should update room_reservation" do
    patch room_reservation_url(@room_reservation), params: { room_reservation: { booking_id: @room_reservation.booking_id, check_in_at: @room_reservation.check_in_at, check_out_at: @room_reservation.check_out_at, note: @room_reservation.note, quantity: @room_reservation.quantity, room_id: @room_reservation.room_id, status: @room_reservation.status, total_price: @room_reservation.total_price } }
    assert_redirected_to room_reservation_url(@room_reservation)
  end

  test "should destroy room_reservation" do
    assert_difference("RoomReservation.count", -1) do
      delete room_reservation_url(@room_reservation)
    end

    assert_redirected_to room_reservations_url
  end
end
