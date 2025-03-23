require "test_helper"

class BookingAdditionalServicesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @booking_additional_service = booking_additional_services(:one)
  end

  test "should get index" do
    get booking_additional_services_url
    assert_response :success
  end

  test "should get new" do
    get new_booking_additional_service_url
    assert_response :success
  end

  test "should create booking_additional_service" do
    assert_difference("BookingAdditionalService.count") do
      post booking_additional_services_url, params: { booking_additional_service: { additional_service_id: @booking_additional_service.additional_service_id, note: @booking_additional_service.note, quantity: @booking_additional_service.quantity, reservation_id: @booking_additional_service.reservation_id, total_price: @booking_additional_service.total_price, unit: @booking_additional_service.unit } }
    end

    assert_redirected_to booking_additional_service_url(BookingAdditionalService.last)
  end

  test "should show booking_additional_service" do
    get booking_additional_service_url(@booking_additional_service)
    assert_response :success
  end

  test "should get edit" do
    get edit_booking_additional_service_url(@booking_additional_service)
    assert_response :success
  end

  test "should update booking_additional_service" do
    patch booking_additional_service_url(@booking_additional_service), params: { booking_additional_service: { additional_service_id: @booking_additional_service.additional_service_id, note: @booking_additional_service.note, quantity: @booking_additional_service.quantity, reservation_id: @booking_additional_service.reservation_id, total_price: @booking_additional_service.total_price, unit: @booking_additional_service.unit } }
    assert_redirected_to booking_additional_service_url(@booking_additional_service)
  end

  test "should destroy booking_additional_service" do
    assert_difference("BookingAdditionalService.count", -1) do
      delete booking_additional_service_url(@booking_additional_service)
    end

    assert_redirected_to booking_additional_services_url
  end
end
