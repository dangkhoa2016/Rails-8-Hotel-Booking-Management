additional_services = AdditionalService.all

Booking.all.each do |booking|
  booking.room_reservations.each do |room_reservation|
    number_of_services = additional_services.sample(rand(0..3))
    next if number_of_services.blank?

    number_of_services.each do |additional_service|
      quantity = rand(1..5)

      BookingAdditionalService.new(
        booking_id: booking.id,
        room_reservation_id: room_reservation.id,
        additional_service_id: additional_service.id,
        quantity: quantity,
        total_price: additional_service.price * quantity,
        created_at: booking.created_at,
        updated_at: booking.updated_at,
      ).save!
    end
  end
end
