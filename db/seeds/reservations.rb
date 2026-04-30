require_relative './us_names'
rooms = Room.all
sample_occupants = Seeds::UsNames::LIST.shuffle.sample(30)

def next_available_stay(room_id, check_in_at, stay_length)
  loop do
    check_out_at = check_in_at + stay_length
    overlapping_reservations = Reservation.where(room_id: room_id)
      .where.not(status: :canceled)
      .where("check_in_at < ? AND check_out_at > ?", check_out_at, check_in_at)

    return [ check_in_at, check_out_at ] unless overlapping_reservations.exists?

    check_in_at = overlapping_reservations.maximum(:check_out_at) + 1.hour
  end
end

Booking.all.each do |booking|
  next if booking.reservations.exists?

  booked_rooms = rooms.sample(rand(1..3))
  group_guest = rand > 0.7
  room_occupants = group_guest ? sample_occupants.sample(booked_rooms.size) : []

  booked_rooms.each_with_index do |room, index|
    stay_length = rand(1..10).days
    check_in_at = booking.created_at.since(rand(-10..10).days)
    check_in_at, check_out_at = next_available_stay(room.id, check_in_at, stay_length)

    Reservation.new(
      room_id: room.id,
      booking_id: booking.id,
      check_in_at: check_in_at,
      check_out_at: check_out_at,
      room_price: room.price,
      note: group_guest ? "Group booking" : "Individual booking",
      room_occupant: room_occupants[index],
      created_at: booking.created_at,
      updated_at: booking.created_at.since(rand(100..10000).minutes),
    ).save!
  end
end
