require "application_system_test_case"

class BookingFlowTest < ApplicationSystemTestCase
  driven_by :rack_test

  setup do
    @booking = bookings(:one)
  end

  test "signed in users see the sidebar on booking pages" do
    visit bookings_url

    assert_selector ".sidebar"
    assert_selector "h2", text: "Bookings"
  end

  test "signed in users can create a booking from the form" do
    visit new_booking_url

    find("#booking_customer_id").find("option[value='#{@booking.customer_id}']").select_option
    fill_in "Discount note", with: @booking.discount_note
    fill_in "Note", with: @booking.note
    find("#booking_status").find("option[value='#{@booking.status}']").select_option
    fill_in "Total price", with: @booking.total_price
    fill_in "Total price before discount", with: @booking.total_price_before_discount
    click_on "Create Booking"

    assert_text "Booking was successfully created"
  end

  test "signed in users can update a booking from the form" do
    visit edit_booking_url(@booking)

    fill_in "Note", with: "Updated booking note"
    click_on "Update Booking"

    assert_text "Booking was successfully updated"
    assert_text "Updated booking note"
  end
end
