Booking.all.each do |booking|
  next if rand > 0.4

  vip_customer_benefits = booking.vip_customer_benefits.active
  next if vip_customer_benefits.empty?

  vip_customer_benefits.each do |vip_customer_benefit|
    created_at = booking.created_at.since(rand(100..10000).minutes)

    BookingVipCustomerDiscount.new(
      booking_id: booking.id,
      customer_id: booking.customer_id,
      discount_type: vip_customer_benefit.discount_type,
      discount_percent_on_room_price: vip_customer_benefit.discount_percent_on_room_price,
      discount_percent_on_additional_services: vip_customer_benefit.discount_percent_on_additional_services,
      discount_amount_on_room_price: vip_customer_benefit.discount_amount_on_room_price,
      discount_amount_on_additional_services: vip_customer_benefit.discount_amount_on_additional_services,
      created_at: created_at,
      updated_at: created_at.since(rand(100..10000).minutes),
    ).save! rescue nil
  end
end
