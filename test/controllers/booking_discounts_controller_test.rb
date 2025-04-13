require "test_helper"

class BookingDiscountsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @booking_discount = booking_discounts(:one)
    @booking2 = bookings(:two)
    sign_in users(:one)
  end

  test "should get index" do
    get booking_discounts_url
    assert_response :success
  end

  test "should get new" do
    get new_booking_discount_url
    assert_response :success
  end

  test "should create booking_discount" do
    assert_difference("BookingDiscount.count") do
      post booking_discounts_url, params: { booking_discount: {
          booking_id: @booking2.id, discount_amount: @booking_discount.discount_amount,
          discount_percent: @booking_discount.discount_percent,
          discount_type: @booking_discount.discount_type,
          note: @booking_discount.note, promotion_id: @booking_discount.promotion_id,
          reason_for_discount: @booking_discount.reason_for_discount
        }
      }
    end

    assert_redirected_to booking_discount_url(BookingDiscount.reorder(id: :desc).first)
  end

  test "should show booking_discount" do
    get booking_discount_url(@booking_discount)
    assert_response :success
  end

  test "should get edit" do
    get edit_booking_discount_url(@booking_discount)
    assert_response :success
  end

  test "should update booking_discount" do
    patch booking_discount_url(@booking_discount), params: { booking_discount: {
        booking_id: @booking2.id, discount_amount: @booking_discount.discount_amount,
        discount_percent: @booking_discount.discount_percent,
        discount_type: @booking_discount.discount_type,
        note: @booking_discount.note, promotion_id: @booking_discount.promotion_id,
        reason_for_discount: @booking_discount.reason_for_discount
      }
    }
    assert_redirected_to booking_discount_url(@booking_discount)
  end

  test "should destroy booking_discount" do
    assert_difference("BookingDiscount.count", -1) do
      delete booking_discount_url(@booking_discount)
    end

    assert_redirected_to booking_discounts_url
  end
end
