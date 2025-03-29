customers = Customer.all.pluck(:id)

number_of_bookings = rand(30..50)
number_of_bookings.times do |n|
  created_at = 2.years.ago.since(rand(1..100).days)
  days = Date.today - created_at.to_date

  Booking.new(
    total_price_before_discount: rand(100..1000),
    customer_id: customers.sample,
    created_at: created_at,
    updated_at: created_at.since(rand(1..days).days),
  ).save!
end
