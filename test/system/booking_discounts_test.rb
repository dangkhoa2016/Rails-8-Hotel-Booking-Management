require "application_system_test_case"

class BookingDiscountsTest < ApplicationSystemTestCase
  setup do
    @booking_discount = booking_discounts(:one)
    @booking2 = bookings(:two)
  end

  test "visiting the index" do
    visit booking_discounts_url
    assert_selector "h2", text: "Booking Discounts"
  end

  test "should create booking discount" do
    visit booking_discounts_url
    click_on "New booking discount"

    find("#booking_discount_booking_id").find("option[value='#{@booking2.id}']").select_option
    fill_in "Discount amount", with: @booking_discount.discount_amount
    fill_in "Discount percent", with: @booking_discount.discount_percent
    find("#booking_discount_discount_type").find("option[value='#{@booking_discount.discount_type}']").select_option
    fill_in "Note", with: @booking_discount.note
    find("#booking_discount_promotion_id").find("option[value='#{@booking_discount.promotion_id}']").select_option
    fill_in "Reason for discount", with: @booking_discount.reason_for_discount
    click_on "Create Booking Discount"

    assert_text "Booking discount was successfully created"
    click_on "Back", match: :first
  end

  test "should update Booking discount" do
    visit booking_discount_url(@booking_discount)
    click_on "Edit", match: :first

    find("#booking_discount_booking_id").find("option[value='#{@booking2.id}']").select_option
    fill_in "Discount amount", with: @booking_discount.discount_amount
    fill_in "Discount percent", with: @booking_discount.discount_percent
    find("#booking_discount_discount_type").find("option[value='#{@booking_discount.discount_type}']").select_option
    fill_in "Note", with: @booking_discount.note
    find("#booking_discount_promotion_id").find("option[value='#{@booking_discount.promotion_id}']").select_option
    fill_in "Reason for discount", with: @booking_discount.reason_for_discount
    click_on "Update Booking Discount"

    assert_text "Booking discount was successfully updated"
    click_on "Back", match: :first
  end

  test "should destroy Booking discount" do
    visit booking_discount_url(@booking_discount)

    accept_alert do
      click_on "Delete", match: :first
    end

    assert_text "Booking discount was successfully destroyed"
  end
end
