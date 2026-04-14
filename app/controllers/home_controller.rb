class HomeController < ApplicationController
  def index
    return unless user_signed_in?

    @total_rooms = Room.active.count
    @available_rooms = Room.active.where(available: true).count
    @occupancy_rate = @total_rooms > 0 ? ((@total_rooms - @available_rooms).to_f / @total_rooms * 100).round(2) : 0

    @recent_bookings = Booking.order(created_at: :desc).limit(5)

    @revenue_by_day = Booking.where("created_at > ?", 30.days.ago).group_by_day(:created_at).sum(:total_price)
    @bookings_by_type = RoomType.joins(rooms: :reservations).group("room_types.name").count("reservations.id")
  end
end
