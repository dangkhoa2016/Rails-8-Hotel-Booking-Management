require "test_helper"

class BookingTest < ActiveSupport::TestCase
  test "preserves manual totals when no pricing inputs exist" do
    booking = Booking.new(
      customer: customers(:one),
      status: :pending,
      total_price_before_discount: 120,
      total_price: 90
    )

    assert booking.valid?
    assert_equal 120.to_d, booking.total_price_before_discount.to_d
    assert_equal 90.to_d, booking.total_price.to_d
  end

  test "calculates totals from reservations services and discounts" do
    booking = bookings(:one)

    booking.valid?

    assert_equal 1700.to_d, booking.total_price_before_discount.to_d
    assert_equal 1280.to_d, booking.total_price.to_d
  end
end
