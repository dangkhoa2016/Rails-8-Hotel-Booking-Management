
rooms = Room.all
sample_occupants = [
  "John Doe",
  "Jane Smith",
  "Alice Johnson",
  "Bob Brown",
  "Charlie Davis",
  "Diana Prince",
  "Ethan Hunt",
  "Felicity Smoak",
  "George Clooney",
  "Hannah Montana",
  "Ian Malcolm",
  "Jack Sparrow",
  "Katherine Pierce",
  "Leonardo DiCaprio",
  "Mia Wallace",
  "Nathan Drake",
  "Olivia Benson",
  "Peter Parker",
  "Quinn Fabray",
  "Ron Swanson"
]

Booking.all.each do |booking|
  booked_rooms = rooms.sample(rand(1..3))
  group_guest = rand > 0.7
  room_occupants = group_guest ? sample_occupants.sample(booked_rooms.size) : []

  booked_rooms.each_with_index do |room, index|
    check_in_at = booking.created_at.since(rand(-10..10).days)

    Reservation.new(
      room_id: room.id,
      booking_id: booking.id,
      check_in_at: check_in_at,
      check_out_at: check_in_at + rand(1..10).days,
      room_price: room.price,
      note: group_guest ? "Group booking" : "Individual booking",
      room_occupant: room_occupants[index],
      created_at: booking.created_at,
      updated_at: booking.created_at.since(rand(100..10000).minutes),
    ).save!
  end
end
