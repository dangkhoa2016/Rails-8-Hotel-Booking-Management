require "test_helper"

class SpecialRequestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @special_request = special_requests(:one)
    sign_in users(:one)
  end

  test "should get index" do
    get special_requests_url
    assert_response :success
  end

  test "should get new" do
    get new_special_request_url
    assert_response :success
  end

  test "should create special_request" do
    assert_difference("SpecialRequest.count") do
      post special_requests_url, params: {
        special_request: {
          booking_id: @special_request.booking_id, price: @special_request.price,
          request: @special_request.request + " test", reservation_id: @special_request.reservation_id
        }
      }
    end

    assert_redirected_to special_request_url(SpecialRequest.reorder(id: :desc).first)
  end

  test "should show special_request" do
    get special_request_url(@special_request)
    assert_response :success
  end

  test "should get edit" do
    get edit_special_request_url(@special_request)
    assert_response :success
  end

  test "should update special_request" do
    patch special_request_url(@special_request), params: {
      special_request: {
        booking_id: @special_request.booking_id, price: @special_request.price,
        request: @special_request.request + " test", reservation_id: @special_request.reservation_id
      }
    }
    assert_redirected_to special_request_url(@special_request)
  end

  test "should destroy special_request" do
    assert_difference("SpecialRequest.count", -1) do
      delete special_request_url(@special_request)
    end

    assert_redirected_to special_requests_url
  end
end
