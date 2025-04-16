Booking.includes(:booking_discounts, :promotions, :booking_vip_customer_discounts).map do |booking|
  [ booking.id, booking.total_discounts ]
end
