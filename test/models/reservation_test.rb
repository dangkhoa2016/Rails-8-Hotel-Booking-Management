require "test_helper"

class ReservationTest < ActiveSupport::TestCase
  test "updates booking totals after reservation changes" do
    reservation = reservations(:two)
    booking = reservation.booking

    reservation.update!(check_out_at: reservation.check_out_at + 1.day)

    assert_equal 930.to_d, booking.reload.total_price_before_discount.to_d
    assert_equal 815.to_d, booking.total_price.to_d
  end
end
