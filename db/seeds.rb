# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts 'Seeding Users...'
load 'db/seeds/users.rb'
puts "Done seeding Users: #{User.count} records"

puts 'Seeding Customers...'
load 'db/seeds/customers.rb'
puts "Done seeding Customers: #{Customer.count} records"

puts 'Seeding VIP Customers Benefits...'
load 'db/seeds/vip_customers_benefits.rb'
puts "Done seeding VIP Customers Benefits: #{VipCustomersBenefit.count} records"

puts 'Seeding Additional Services...'
load 'db/seeds/additional_services.rb'
puts "Done seeding Additional Services: #{AdditionalService.count} records"

puts 'Seeding Promotions...'
load 'db/seeds/promotions.rb'
puts "Done seeding Promotions: #{Promotion.count} records"

puts 'Seeding Facilities...'
load 'db/seeds/facilities.rb'
puts "Done seeding Facilities: #{Facility.count} records"

puts 'Seeding Hotel Locations...'
load 'db/seeds/hotel_locations.rb'
puts "Done seeding Hotel Locations: #{HotelLocation.count} records"

puts 'Seeding Room Types...'
load 'db/seeds/room_types.rb'
puts "Done seeding Room Types: #{RoomType.count} records"

puts 'Seeding Rooms...'
load 'db/seeds/rooms.rb'
puts "Done seeding Rooms: #{Room.count} records"

puts 'Seeding Facilities Rooms...'
load 'db/seeds/facilities_rooms.rb'
puts "Done seeding Facilities Rooms: #{FacilitiesRoom.count} records"

puts 'Seeding Bookings...'
load 'db/seeds/bookings.rb'
puts "Done seeding Bookings: #{Booking.count} records"

puts 'Seeding Booking Discounts...'
load 'db/seeds/booking_discounts.rb'
puts "Done seeding Booking Discounts: #{BookingDiscount.count} records"

puts 'Seeding Booking VIP Customer Discounts...'
load 'db/seeds/booking_vip_customer_discounts.rb'
puts "Done seeding Booking VIP Customer Discounts: #{BookingVipCustomerDiscount.count} records"

puts 'Seeding Reviews...'
load 'db/seeds/reviews.rb'
puts "Done seeding Reviews: #{Review.count} records"

puts 'Seeding Reservations...'
load 'db/seeds/reservations.rb'
puts "Done seeding Reservations: #{Reservation.count} records"

puts 'Seeding Booking Additional Services...'
load 'db/seeds/booking_additional_services.rb'
puts "Done seeding Booking Additional Services: #{BookingAdditionalService.count} records"

puts 'Seeding Special Requests...'
load 'db/seeds/special_requests.rb'
puts "Done seeding Special Requests: #{SpecialRequest.count} records"

puts 'Seeding Calculated Booking Total Prices...'
load 'db/seeds/calculated_booking_total_prices.rb'
puts "Done seeding Calculated Booking Total Prices"

puts 'Seeding Payments...'
load 'db/seeds/payments.rb'
puts "Done seeding Payments: #{Payment.count} records"

puts 'Seed completed!'
