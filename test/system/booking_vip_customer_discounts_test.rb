require "application_system_test_case"

class BookingVipCustomerDiscountsTest < ApplicationSystemTestCase
  setup do
    @booking_vip_customer_discount = booking_vip_customer_discounts(:one)
  end

  test "visiting the index" do
    visit booking_vip_customer_discounts_url
    assert_selector "h1", text: "Booking vip customer discounts"
  end

  test "should create booking vip customer discount" do
    visit booking_vip_customer_discounts_url
    click_on "New booking vip customer discount"

    fill_in "Booking", with: @booking_vip_customer_discount.booking_id
    fill_in "Customer", with: @booking_vip_customer_discount.customer_id
    fill_in "Discount amount on additional services", with: @booking_vip_customer_discount.discount_amount_on_additional_services
    fill_in "Discount amount on room price", with: @booking_vip_customer_discount.discount_amount_on_room_price
    fill_in "Discount percent on additional services", with: @booking_vip_customer_discount.discount_percent_on_additional_services
    fill_in "Discount percent on room price", with: @booking_vip_customer_discount.discount_percent_on_room_price
    fill_in "Discount type", with: @booking_vip_customer_discount.discount_type
    click_on "Create Booking vip customer discount"

    assert_text "Booking vip customer discount was successfully created"
    click_on "Back"
  end

  test "should update Booking vip customer discount" do
    visit booking_vip_customer_discount_url(@booking_vip_customer_discount)
    click_on "Edit this booking vip customer discount", match: :first

    fill_in "Booking", with: @booking_vip_customer_discount.booking_id
    fill_in "Customer", with: @booking_vip_customer_discount.customer_id
    fill_in "Discount amount on additional services", with: @booking_vip_customer_discount.discount_amount_on_additional_services
    fill_in "Discount amount on room price", with: @booking_vip_customer_discount.discount_amount_on_room_price
    fill_in "Discount percent on additional services", with: @booking_vip_customer_discount.discount_percent_on_additional_services
    fill_in "Discount percent on room price", with: @booking_vip_customer_discount.discount_percent_on_room_price
    fill_in "Discount type", with: @booking_vip_customer_discount.discount_type
    click_on "Update Booking vip customer discount"

    assert_text "Booking vip customer discount was successfully updated"
    click_on "Back"
  end

  test "should destroy Booking vip customer discount" do
    visit booking_vip_customer_discount_url(@booking_vip_customer_discount)
    click_on "Destroy this booking vip customer discount", match: :first

    assert_text "Booking vip customer discount was successfully destroyed"
  end
end
