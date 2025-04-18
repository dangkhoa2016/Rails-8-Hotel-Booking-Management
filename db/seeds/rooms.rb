rooms = [
  { name: 'Standard Room 1', room_type_id: 1, hotel_location_id: 1, capacity: 2, price: 100.0, half_day_price_morning: 50.0, half_day_price_afternoon: 60.0, summary: 'Basic room with essential amenities' },
  { name: 'Standard Room 2', room_type_id: 1, hotel_location_id: 2, capacity: 2, price: 110.0, half_day_price_morning: 55.0, half_day_price_afternoon: 65.0, summary: 'Comfortable room with a nice view' },
  { name: 'Deluxe Room 1', room_type_id: 2, hotel_location_id: 3, capacity: 3, price: 150.0, half_day_price_morning: 75.0, half_day_price_afternoon: 85.0, summary: 'Spacious room with additional amenities' },
  { name: 'Deluxe Room 2', room_type_id: 2, hotel_location_id: 4, capacity: 3, price: 160.0, half_day_price_morning: 80.0, half_day_price_afternoon: 90.0, summary: 'Spacious and elegant room' },
  { name: 'Suite 1', room_type_id: 3, hotel_location_id: 1, capacity: 4, price: 250.0, half_day_price_morning: 125.0, half_day_price_afternoon: 135.0, summary: 'Luxurious suite with a separate living area' },
  { name: 'Suite 2', room_type_id: 3, hotel_location_id: 1, capacity: 4, price: 270.0, half_day_price_morning: 135.0, half_day_price_afternoon: 145.0, summary: 'Elegant suite with premium comfort' },
  { name: 'Family Room 1', room_type_id: 4, hotel_location_id: 2, capacity: 5, price: 200.0, half_day_price_morning: 100.0, half_day_price_afternoon: 110.0, summary: 'Room with multiple beds for families' },
  { name: 'Family Room 2', room_type_id: 4, hotel_location_id: 3, capacity: 5, price: 210.0, half_day_price_morning: 105.0, half_day_price_afternoon: 115.0, summary: 'Family-friendly room with spacious layout' },
  { name: 'Honeymoon Suite 1', room_type_id: 5, hotel_location_id: 4, capacity: 2, price: 300.0, half_day_price_morning: 150.0, half_day_price_afternoon: 160.0, summary: 'Romantic suite for couples' },
  { name: 'Honeymoon Suite 2', room_type_id: 5, hotel_location_id: 4, capacity: 2, price: 320.0, half_day_price_morning: 160.0, half_day_price_afternoon: 170.0, summary: 'Luxury suite for romantic getaways' },
  { name: 'Presidential Suite 1', room_type_id: 6, hotel_location_id: 1, capacity: 6, price: 500.0, half_day_price_morning: 250.0, half_day_price_afternoon: 270.0, summary: 'Premium suite with all luxury amenities' },
  { name: 'Presidential Suite 2', room_type_id: 6, hotel_location_id: 2, capacity: 6, price: 520.0, half_day_price_morning: 260.0, half_day_price_afternoon: 280.0, summary: 'Exclusive suite with a private view' },
  { name: 'Penthouse Suite 1', room_type_id: 7, hotel_location_id: 3, capacity: 4, price: 600.0, half_day_price_morning: 300.0, half_day_price_afternoon: 320.0, summary: 'Exclusive suite with panoramic views' },
  { name: 'Penthouse Suite 2', room_type_id: 7, hotel_location_id: 4, capacity: 4, price: 620.0, half_day_price_morning: 310.0, half_day_price_afternoon: 330.0, summary: 'Luxurious suite with stunning views' },
  { name: 'Villa 1', room_type_id: 8, hotel_location_id: 1, capacity: 6, price: 700.0, half_day_price_morning: 350.0, half_day_price_afternoon: 370.0, summary: 'Private villa with pool and garden' },
  { name: 'Villa 2', room_type_id: 8, hotel_location_id: 1, capacity: 6, price: 720.0, half_day_price_morning: 360.0, half_day_price_afternoon: 380.0, summary: 'Exclusive villa with luxury amenities' },
  { name: 'Bungalow 1', room_type_id: 9, hotel_location_id: 2, capacity: 4, price: 400.0, half_day_price_morning: 200.0, half_day_price_afternoon: 220.0, summary: 'Secluded bungalow with ocean views' },
  { name: 'Bungalow 2', room_type_id: 9, hotel_location_id: 3, capacity: 4, price: 420.0, half_day_price_morning: 210.0, half_day_price_afternoon: 230.0, summary: 'Private bungalow with beach access' },
  { name: 'Cabin 1', room_type_id: 10, hotel_location_id: 4, capacity: 2, price: 150.0, half_day_price_morning: 75.0, half_day_price_afternoon: 85.0, summary: 'Rustic cabin in the woods' },
  { name: 'Cabin 2', room_type_id: 10, hotel_location_id: 4, capacity: 2, price: 160.0, half_day_price_morning: 80.0, half_day_price_afternoon: 90.0, summary: 'Cozy cabin with a fireplace' },
  { name: 'Treehouse 1', room_type_id: 11, hotel_location_id: 1, capacity: 2, price: 200.0, half_day_price_morning: 100.0, half_day_price_afternoon: 110.0, summary: 'Unique treehouse accommodation' },
  { name: 'Treehouse 2', room_type_id: 11, hotel_location_id: 2, capacity: 2, price: 210.0, half_day_price_morning: 105.0, half_day_price_afternoon: 115.0, summary: 'Treehouse with modern comforts' },
  { name: 'Yurt 1', room_type_id: 12, hotel_location_id: 3, capacity: 2, price: 180.0, half_day_price_morning: 90.0, half_day_price_afternoon: 100.0, summary: 'Traditional yurt with modern amenities' },
  { name: 'Yurt 2', room_type_id: 12, hotel_location_id: 4, capacity: 2, price: 190.0, half_day_price_morning: 95.0, half_day_price_afternoon: 105.0, summary: 'Yurt with a cozy interior' },
  { name: 'Tent 1', room_type_id: 13, hotel_location_id: 1, capacity: 2, price: 100.0, half_day_price_morning: 50.0, half_day_price_afternoon: 60.0, summary: 'Spacious tent for camping adventures' },
  { name: 'Tent 2', room_type_id: 13, hotel_location_id: 1, capacity: 2, price: 110.0, half_day_price_morning: 55.0, half_day_price_afternoon: 65.0, summary: 'Luxury tent with hotel-style amenities' },
  { name: 'Houseboat 1', room_type_id: 14, hotel_location_id: 2, capacity: 4, price: 300.0, half_day_price_morning: 150.0, half_day_price_afternoon: 160.0, summary: 'Floating houseboat on the water' },
  { name: 'Houseboat 2', room_type_id: 14, hotel_location_id: 3, capacity: 4, price: 320.0, half_day_price_morning: 160.0, half_day_price_afternoon: 170.0, summary: 'Houseboat with a panoramic view' },
  { name: 'Castle 1', room_type_id: 15, hotel_location_id: 3, capacity: 10, price: 1000.0, half_day_price_morning: 500.0, half_day_price_afternoon: 550.0, summary: 'Historic castle with royal charm' },
  { name: 'Castle 2', room_type_id: 15, hotel_location_id: 3, capacity: 10, price: 1100.0, half_day_price_morning: 550.0, half_day_price_afternoon: 600.0, summary: 'Castle with luxurious amenities' },
  { name: 'Igloo 1', room_type_id: 16, hotel_location_id: 1, capacity: 2, price: 200.0, half_day_price_morning: 100.0, half_day_price_afternoon: 110.0, summary: 'Ice igloo for a winter wonderland experience' },
  { name: 'Igloo 2', room_type_id: 16, hotel_location_id: 2, capacity: 2, price: 210, half_day_price_morning: 105.0, half_day_price_afternoon: 115.0, summary: 'Igloo with cozy interiors' }
]

rooms.each do |room|
  Room.find_or_create_by!(room)
end
