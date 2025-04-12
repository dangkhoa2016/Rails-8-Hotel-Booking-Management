require "test_helper"

class ReservationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @reservation = reservations(:one)
    @room2 = rooms(:two)
    @room2.update_column(:available, true)
    sign_in users(:one)
  end

  test "should get index" do
    get reservations_url
    assert_response :success
  end

  test "should get new" do
    get new_reservation_url
    assert_response :success
  end

  test "should create reservation" do
    assert_difference("Reservation.count") do
      post reservations_url, params: { reservation: {
          booking_id: @reservation.booking_id, check_in_at: @reservation.check_in_at,
          check_out_at: @reservation.check_out_at, note: @reservation.note,
          room_id: @room2.id, room_occupant: @reservation.room_occupant,
          status: @reservation.status, room_price: @reservation.room_price
        }
      }
    end

    assert_redirected_to reservation_url(Reservation.last)
  end

  test "should show reservation" do
    get reservation_url(@reservation)
    assert_response :success
  end

  test "should get edit" do
    get edit_reservation_url(@reservation)
    assert_response :success
  end

  test "should update reservation" do
    patch reservation_url(@reservation), params: { reservation: {
      booking_id: @reservation.booking_id, check_in_at: @reservation.check_in_at,
      check_out_at: @reservation.check_out_at, note: @reservation.note,
      room_id: @room2.id, room_occupant: @reservation.room_occupant,
      status: @reservation.status, room_price: @reservation.room_price
    }
  }
    assert_redirected_to reservation_url(@reservation)
  end

  test "should destroy reservation" do
    assert_difference("Reservation.count", -1) do
      delete reservation_url(@reservation)
    end

    assert_redirected_to reservations_url
  end
end
