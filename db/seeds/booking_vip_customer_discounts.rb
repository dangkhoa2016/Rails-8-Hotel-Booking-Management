Booking.all.each do |booking|
  next if rand > 0.3

  vip_customers_benefits = booking.vip_customers_benefits.active
  next if vip_customers_benefits.empty?

  vip_customers_benefits.each do |vip_customers_benefit|
    created_at = booking.created_at.since(rand(100..10000).minutes)

    BookingVipCustomerDiscount.new(
      booking_id: booking.id,
      customer_id: booking.customer_id,
      discount_type: vip_customers_benefit.discount_type,
      discount_percent_on_room_price: vip_customers_benefit.discount_percent_on_room_price,
      discount_percent_on_additional_services: vip_customers_benefit.discount_percent_on_additional_services,
      discount_amount_on_room_price: vip_customers_benefit.discount_amount_on_room_price,
      discount_amount_on_additional_services: vip_customers_benefit.discount_amount_on_additional_services,
      created_at: created_at,
      updated_at: created_at.since(rand(100..10000).minutes),
    ).save!
  end
end
