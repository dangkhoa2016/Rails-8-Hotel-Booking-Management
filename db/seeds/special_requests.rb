special_requests = [ "Extra bed in room",
"Baby cot in room",
"High chair in room",
"Extra towel in room",
"Extra pillow in room",
"Extra blanket in room",
"Extra toiletries in room",
"Extra room cleaning",
"Late check-out time",
"Early check-in time",
"Upgrade to better room",
"Downgrade to cheaper room",
"Change to different room",
"Room service for meals"
]

Booking.all.each do |booking|
  next if rand > 0.7

  booking.reservations.each do |reservation|
    number_of_requests = special_requests.sample(rand(1..3))
    number_of_requests.each do |special_request|
      next if rand > 0.7

      created_at = booking.created_at + rand(10..10000).minutes

      SpecialRequest.new(
        booking_id: booking.id,
        reservation_id: reservation.id,
        request: special_request,
        price: rand(5..50),
        created_at: created_at,
        updated_at: created_at.since(rand(100..10000).minutes),
      ).save!
    end
  end
end
