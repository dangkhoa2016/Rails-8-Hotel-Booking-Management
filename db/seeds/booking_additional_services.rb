additional_services = AdditionalService.all

Reservation.all.each do |reservation|
  number_of_services = additional_services.sample(rand(0..3))
  next if number_of_services.blank?

  number_of_services.each do |additional_service|
    quantity = rand(1..5)

    BookingAdditionalService.new(
      reservation_id: reservation.id,
      additional_service_id: additional_service.id,
      quantity: quantity,
      unit: additional_service.unit,
      total_price: additional_service.price * quantity,
      created_at: reservation.created_at,
      updated_at: reservation.updated_at,
    ).save!
  end
end
