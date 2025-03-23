
rooms = Room.all

Booking.all.each do |booking|
  booked_rooms = rooms.sample(rand(1..3))
  booked_rooms.each do |room|
    check_in_at = booking.created_at.since(rand(-10..10).days)
    quantity = rand(1..3)

    Reservation.new(
      room_id: room.id,
      booking_id: booking.id,
      check_in_at: check_in_at,
      check_out_at: check_in_at + rand(1..10).days,
      quantity: quantity,
      total_price: room.price * quantity,
      created_at: booking.created_at,
      updated_at: booking.created_at.since(rand(100..10000).minutes),
    ).save!
  end
end
