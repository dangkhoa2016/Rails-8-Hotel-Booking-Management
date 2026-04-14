require "test_helper"

class BookingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @booking = bookings(:one)
    sign_in users(:one)
  end

  test "should get index" do
    get bookings_url
    assert_response :success
  end

  test "should get new" do
    get new_booking_url
    assert_response :success
  end

  test "should create booking" do
    assert_difference("Booking.count") do
      post bookings_url, params: { booking: { customer_id: @booking.customer_id, discount_note: @booking.discount_note, note: @booking.note, status: @booking.status, total_price: @booking.total_price, total_price_before_discount: @booking.total_price_before_discount } }
    end

    created_booking = Booking.reorder(id: :desc).first

    assert_redirected_to booking_url(created_booking)
    assert_equal @booking.total_price.to_d, created_booking.total_price.to_d
    assert_equal @booking.total_price_before_discount.to_d, created_booking.total_price_before_discount.to_d
  end

  test "should show booking" do
    get booking_url(@booking)
    assert_response :success
  end

  test "should get edit" do
    get edit_booking_url(@booking)
    assert_response :success
  end

  test "should update booking" do
    patch booking_url(@booking), params: { booking: { customer_id: @booking.customer_id, discount_note: @booking.discount_note, note: @booking.note, status: @booking.status, total_price: @booking.total_price, total_price_before_discount: @booking.total_price_before_discount } }
    assert_redirected_to booking_url(@booking)
  end

  test "should destroy booking" do
    assert_difference("Booking.count", -1) do
      delete booking_url(@booking)
    end

    assert_redirected_to bookings_url
  end
end
