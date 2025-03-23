def generate_random_array(total)
  total = total.to_i
  array = []
  return array if total <= 0

  while total > 0
    if total > 50
      percent = rand(10..100)
      amount = (total * percent / 100).round(2)
      total -= amount
    else
      amount = total
      total = 0
    end

    array << amount
  end

  array
end

payment_types = Payment.payment_types.keys
one_time_payment = payment_types.delete('one_time_payment')

Booking.all.each do |booking|
  number_of_payments = generate_random_array(booking.total_price)
  last_payment = booking.created_at

  number_of_payments.each_with_index do |amount, index|
    break if rand > 0.7

    last_payment = last_payment.since(rand(100..10000).minutes)

    Payment.new(
      booking_id: booking.id,
      payment_method: Payment.payment_methods.keys.sample,
      payment_type: number_of_payments.size == 1 ? one_time_payment : payment_types.sample,
      amount: amount,
      payment_date: last_payment,
      note: number_of_payments.size == 1 ? "Full payment" : "Payment ##{index + 1}",
      created_at: last_payment.since(rand(-10000..10000).seconds),
      updated_at: last_payment.since(rand(100..10000).minutes),
    ).save!
  end
end
