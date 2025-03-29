require "application_system_test_case"

class BookingsTest < ApplicationSystemTestCase
  setup do
    @booking = bookings(:one)
  end

  test "visiting the index" do
    visit bookings_url
    assert_selector "h1", text: "Bookings"
  end

  test "should create booking" do
    visit bookings_url
    click_on "New booking"

    fill_in "Customer", with: @booking.customer_id
    fill_in "Discount note", with: @booking.discount_note
    fill_in "Note", with: @booking.note
    find("#booking_status").find("option[value='#{@booking.status}']").select_option
    fill_in "Total price", with: @booking.total_price
    fill_in "Total price before discount", with: @booking.total_price_before_discount
    click_on "Create Booking"

    assert_text "Booking was successfully created"
    click_on "Back"
  end

  test "should update Booking" do
    visit booking_url(@booking)
    click_on "Edit", match: :first

    fill_in "Customer", with: @booking.customer_id
    fill_in "Discount note", with: @booking.discount_note
    fill_in "Note", with: @booking.note
    find("#booking_status").find("option[value='#{@booking.status}']").select_option
    fill_in "Total price", with: @booking.total_price
    fill_in "Total price before discount", with: @booking.total_price_before_discount
    click_on "Update Booking"

    assert_text "Booking was successfully updated"
    click_on "Back"
  end

  test "should destroy Booking" do
    visit booking_url(@booking)

    accept_alert do
      click_on "Delete", match: :first
    end

    assert_text "Booking was successfully destroyed"
  end
end
