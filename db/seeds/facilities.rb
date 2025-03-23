facilities = [
  { name: 'Free Wifi', summary: 'High-speed internet access' },
  { name: 'Swimming Pool', summary: 'Outdoor swimming pool' },
  { name: 'Fitness Center', summary: 'Fully-equipped gym' },
  { name: 'Spa', summary: 'Relaxing spa services' },
  { name: 'Restaurant', summary: 'On-site dining options' },
  { name: 'Bar', summary: 'Cocktails and drinks' },
  { name: 'Concierge', summary: 'Personalized concierge service' },
  { name: 'Business Center', summary: 'Meeting and event spaces' },
  { name: 'Parking', summary: 'Secure parking facilities' },
  { name: 'Airport Shuttle', summary: 'Complimentary airport shuttle' },
  { name: 'Pet Friendly', summary: 'Pet-friendly accommodations' },
  { name: 'Family Friendly', summary: 'Family-friendly amenities' },
  { name: 'Non-smoking Rooms', summary: 'Smoke-free guest rooms' },
  { name: 'Accessible Rooms', summary: 'Accessible accommodations' },
  { name: 'Laundry Service', summary: 'On-site laundry facilities' },
  { name: 'Luggage Storage', summary: 'Secure luggage storage' },
  { name: 'Currency Exchange', summary: 'Convenient currency exchange' },
  { name: 'Gift Shop', summary: 'Souvenirs and gifts' },
  { name: 'Hot Tub', summary: 'Relax in a hot tub' },
  { name: 'Outdoor Dining', summary: 'Enjoy dining in the open air' },
  { name: 'Golf Course', summary: 'Access to a golf course' },
  { name: 'Tennis Court', summary: 'Tennis courts available for guests' },
  { name: 'Jacuzzi', summary: 'Private jacuzzi for relaxation' },
  { name: 'Yoga Room', summary: 'Yoga and meditation room' },
  { name: 'Helipad', summary: 'Helicopter landing pad' },
  { name: 'Nightclub', summary: 'In-house nightclub and music' },
  { name: 'Cooking Classes', summary: 'Learn how to cook local cuisine' },
  { name: 'Library', summary: 'Quiet space with books and magazines' }
]

facilities.each do |facility|
  Facility.find_or_create_by!(facility)
end
