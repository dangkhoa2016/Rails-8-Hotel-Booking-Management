require "application_system_test_case"

class BookingAdditionalServicesTest < ApplicationSystemTestCase
  setup do
    @booking_additional_service = booking_additional_services(:one)
  end

  test "visiting the index" do
    visit booking_additional_services_url
    assert_selector "h1", text: "Booking Additional Services"
  end

  test "should create booking additional service" do
    visit booking_additional_services_url
    click_on "New booking additional service"

    fill_in "Additional service", with: @booking_additional_service.additional_service_id
    fill_in "Booking", with: @booking_additional_service.booking_id
    fill_in "Note", with: @booking_additional_service.note
    fill_in "Quantity", with: @booking_additional_service.quantity
    fill_in "Room reservation", with: @booking_additional_service.reservation_id
    fill_in "Total price", with: @booking_additional_service.total_price
    fill_in "Unit", with: @booking_additional_service.unit
    click_on "Create Booking Additional Service"

    assert_text "Booking additional service was successfully created"
    click_on "Back"
  end

  test "should update Booking additional service" do
    visit booking_additional_service_url(@booking_additional_service)
    click_on "Edit this booking additional service", match: :first

    fill_in "Additional service", with: @booking_additional_service.additional_service_id
    fill_in "Booking", with: @booking_additional_service.booking_id
    fill_in "Note", with: @booking_additional_service.note
    fill_in "Quantity", with: @booking_additional_service.quantity
    fill_in "Room reservation", with: @booking_additional_service.reservation_id
    fill_in "Total price", with: @booking_additional_service.total_price
    fill_in "Unit", with: @booking_additional_service.unit
    click_on "Update Booking Additional Service"

    assert_text "Booking additional service was successfully updated"
    click_on "Back"
  end

  test "should destroy Booking additional service" do
    visit booking_additional_service_url(@booking_additional_service)
    click_on "Destroy this booking additional service", match: :first

    assert_text "Booking additional service was successfully destroyed"
  end
end
