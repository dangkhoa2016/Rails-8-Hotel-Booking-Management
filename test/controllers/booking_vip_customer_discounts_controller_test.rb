require "test_helper"

class BookingVipCustomerDiscountsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @booking_vip_customer_discount = booking_vip_customer_discounts(:one)
    @booking2 = bookings(:two)
    sign_in users(:one)
  end

  test "should get index" do
    get booking_vip_customer_discounts_url
    assert_response :success
  end

  test "should get new" do
    get new_booking_vip_customer_discount_url
    assert_response :success
  end

  test "should create booking_vip_customer_discount" do
    assert_difference("BookingVipCustomerDiscount.count") do
      post booking_vip_customer_discounts_url, params: {
        booking_vip_customer_discount: {
          booking_id: @booking2.id,
          customer_id: @booking_vip_customer_discount.customer_id,
          discount_amount_on_additional_services: @booking_vip_customer_discount.discount_amount_on_additional_services,
          discount_amount_on_room_price: @booking_vip_customer_discount.discount_amount_on_room_price,
          discount_percent_on_additional_services: @booking_vip_customer_discount.discount_percent_on_additional_services,
          discount_percent_on_room_price: @booking_vip_customer_discount.discount_percent_on_room_price,
          discount_type: @booking_vip_customer_discount.discount_type
        }
      }
    end

    assert_redirected_to booking_vip_customer_discount_url(BookingVipCustomerDiscount.last)
  end

  test "should show booking_vip_customer_discount" do
    get booking_vip_customer_discount_url(@booking_vip_customer_discount)
    assert_response :success
  end

  test "should get edit" do
    get edit_booking_vip_customer_discount_url(@booking_vip_customer_discount)
    assert_response :success
  end

  test "should update booking_vip_customer_discount" do
    patch booking_vip_customer_discount_url(@booking_vip_customer_discount), params: {
      booking_vip_customer_discount: {
        booking_id: @booking2.id,
        customer_id: @booking_vip_customer_discount.customer_id,
        discount_amount_on_additional_services: @booking_vip_customer_discount.discount_amount_on_additional_services,
        discount_amount_on_room_price: @booking_vip_customer_discount.discount_amount_on_room_price,
        discount_percent_on_additional_services: @booking_vip_customer_discount.discount_percent_on_additional_services,
        discount_percent_on_room_price: @booking_vip_customer_discount.discount_percent_on_room_price,
        discount_type: @booking_vip_customer_discount.discount_type
      }
    }
    assert_redirected_to booking_vip_customer_discount_url(@booking_vip_customer_discount)
  end

  test "should destroy booking_vip_customer_discount" do
    assert_difference("BookingVipCustomerDiscount.count", -1) do
      delete booking_vip_customer_discount_url(@booking_vip_customer_discount)
    end

    assert_redirected_to booking_vip_customer_discounts_url
  end
end
