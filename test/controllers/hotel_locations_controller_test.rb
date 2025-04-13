require "test_helper"

class HotelLocationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @hotel_location = hotel_locations(:one)
    sign_in users(:one)
  end

  test "should get index" do
    get hotel_locations_url
    assert_response :success
  end

  test "should get new" do
    get new_hotel_location_url
    assert_response :success
  end

  test "should create hotel_location" do
    assert_difference("HotelLocation.count") do
      post hotel_locations_url, params: { hotel_location: {
        address: @hotel_location.address + " test", manager_name: @hotel_location.manager_name,
        name: @hotel_location.name + " test", status: @hotel_location.status
      }
    }
    end

    assert_redirected_to hotel_location_url(HotelLocation.reorder(id: :desc).first)
  end

  test "should show hotel_location" do
    get hotel_location_url(@hotel_location)
    assert_response :success
  end

  test "should get edit" do
    get edit_hotel_location_url(@hotel_location)
    assert_response :success
  end

  test "should update hotel_location" do
    patch hotel_location_url(@hotel_location), params: { hotel_location: {
        address: @hotel_location.address + " test", manager_name: @hotel_location.manager_name,
        name: @hotel_location.name + " test", status: @hotel_location.status
      }
    }
    assert_redirected_to hotel_location_url(@hotel_location)
  end

  test "should destroy hotel_location" do
    assert_difference("HotelLocation.count", -1) do
      delete hotel_location_url(@hotel_location)
    end

    assert_redirected_to hotel_locations_url
  end
end
