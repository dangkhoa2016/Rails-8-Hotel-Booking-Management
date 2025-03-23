def calculate_reservation_total_price(reservation)
  # Calculate the total price for each reservation
  reservation_total_price = reservation.room_price + reservation.special_requests.sum(:price) + reservation.booking_additional_services.sum(:total_price)
  reservation.update_columns(total_price: reservation_total_price)
  reservation_total_price
end

Booking.all.each do |booking|
  total_price_before_discount = 0
  reservations_price = booking.reservations.sum(:room_price)
  additional_services_price = booking.booking_additional_services.sum(:total_price)
  special_requests_price = booking.special_requests.sum(:price)
  total_price_before_discount = reservations_price + additional_services_price + special_requests_price
  total_price = total_price_before_discount

  # get discounts
  booking_discounts = booking.booking_discounts
  # get vip customer discounts
  vip_customer_discounts = booking.booking_vip_customer_discounts
  discount_notes = []

  if vip_customer_discounts.present?
    vip_customer_discounts.each do |discount|
      if discount.percent?
        if discount.discount_percent_on_room_price.present?
          reservations_price = reservations_price - (reservations_price * discount.discount_percent_on_room_price / 100)
          discount_notes << "Discount #{discount.discount_percent_on_room_price}% on room price"
        end

        if discount.discount_percent_on_additional_services.present?
          additional_services_price = additional_services_price - (additional_services_price * discount.discount_percent_on_additional_services / 100)
          discount_notes << "Discount #{discount.discount_percent_on_additional_services}% on additional services"
        end
      else
        if discount.discount_amount_on_room_price.present?
          reservations_price = reservations_price - discount.discount_amount_on_room_price
          discount_notes << "Discount $#{discount.discount_amount_on_room_price} on room price"
        end

        if discount.discount_amount_on_additional_services.present?
          additional_services_price = additional_services_price - discount.discount_amount_on_additional_services
          discount_notes << "Discount $#{discount.discount_amount_on_additional_services} on additional services"
        end
      end
    end

    total_price = reservations_price + additional_services_price + special_requests_price
  end

  if booking_discounts.present?
    booking_discounts.each do |discount|
      if discount.percent?
        total_price = total_price - (total_price * discount.discount_percent / 100)
        discount_notes << "Discount #{discount.discount_percent}% on total price"
      else
        total_price = total_price - discount.discount_amount
        discount_notes << "Discount $#{discount.discount_amount} on total price"
      end
    end
  end

  booking.update_columns({
    total_price: total_price > 0 ? total_price.round(2) : 0,
    total_price_before_discount: total_price_before_discount,
    discount_note: discount_notes.join("\n"),
    note: "Total price before discount: #{total_price_before_discount}\nTotal price after discount: #{total_price}"
  })
end
