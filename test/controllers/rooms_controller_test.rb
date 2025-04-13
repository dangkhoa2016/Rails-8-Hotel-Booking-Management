require "test_helper"

class RoomsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @room = rooms(:one)
    sign_in users(:one)
  end

  test "should get index" do
    get rooms_url
    assert_response :success
  end

  test "should get new" do
    get new_room_url
    assert_response :success
  end

  test "should create room" do
    assert_difference("Room.count") do
      post rooms_url, params: { room: {
          available: @room.available,
          capacity: @room.capacity, half_day_price_afternoon: @room.half_day_price_afternoon,
          half_day_price_morning: @room.half_day_price_morning,
          hotel_location_id: @room.hotel_location_id, name: @room.name + " test",
          price: @room.price, room_type_id: @room.room_type_id,
          status: @room.status, summary: @room.summary
        }
      }
    end

    assert_redirected_to room_url(Room.reorder(id: :desc).first)
  end

  test "should show room" do
    get room_url(@room)
    assert_response :success
  end

  test "should get edit" do
    get edit_room_url(@room)
    assert_response :success
  end

  test "should update room" do
    patch room_url(@room), params: { room: {
        available: @room.available,
        capacity: @room.capacity, half_day_price_afternoon: @room.half_day_price_afternoon,
        half_day_price_morning: @room.half_day_price_morning,
        hotel_location_id: @room.hotel_location_id, name: @room.name + " test",
        price: @room.price, room_type_id: @room.room_type_id,
        status: @room.status, summary: @room.summary
      }
    }
    assert_redirected_to room_url(@room)
  end

  test "should destroy room" do
    assert_difference("Room.count", -1) do
      delete room_url(@room)
    end

    assert_redirected_to rooms_url
  end
end
