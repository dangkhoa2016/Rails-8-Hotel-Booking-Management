require "application_system_test_case"

class BookingDiscountsTest < ApplicationSystemTestCase
  setup do
    @booking_discount = booking_discounts(:one)
    @booking2 = bookings(:two)
  end

  test "visiting the index" do
    visit booking_discounts_url
    assert_selector "h1", text: "Booking Discounts"
  end

  test "should create booking discount" do
    visit booking_discounts_url
    click_on "New booking discount"

    fill_in "Booking", with: @booking2.id
    fill_in "Discount amount", with: @booking_discount.discount_amount
    fill_in "Discount percent", with: @booking_discount.discount_percent
    find("#booking_discount_discount_type").find("option[value='#{@booking_discount.discount_type}']").select_option
    fill_in "Note", with: @booking_discount.note
    fill_in "Promotion", with: @booking_discount.promotion_id
    fill_in "Reason for discount", with: @booking_discount.reason_for_discount
    click_on "Create Booking Discount"

    assert_text "Booking discount was successfully created"
    click_on "Back"
  end

  test "should update Booking discount" do
    visit booking_discount_url(@booking_discount)
    click_on "Edit", match: :first

    fill_in "Booking", with: @booking_discount.booking_id
    fill_in "Discount amount", with: @booking_discount.discount_amount
    fill_in "Discount percent", with: @booking_discount.discount_percent
    find("#booking_discount_discount_type").find("option[value='#{@booking_discount.discount_type}']").select_option
    fill_in "Note", with: @booking_discount.note
    fill_in "Promotion", with: @booking_discount.promotion_id
    fill_in "Reason for discount", with: @booking_discount.reason_for_discount
    click_on "Update Booking Discount"

    assert_text "Booking discount was successfully updated"
    click_on "Back"
  end

  test "should destroy Booking discount" do
    visit booking_discount_url(@booking_discount)

    accept_alert do
      click_on "Delete", match: :first
    end

    assert_text "Booking discount was successfully destroyed"
  end
end
