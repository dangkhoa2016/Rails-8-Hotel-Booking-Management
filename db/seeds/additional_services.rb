additional_services = [
  {
    name: 'Laundry',
    summary: 'Wash and fold',
    price: 10.0,
    unit: 'kg'
  },
  {
    name: 'Water',
    summary: 'Bottle of water',
    price: 1.0,
    unit: 'bottle'
  },
  {
    name: 'Pick-up at airport',
    summary: 'Pick-up at airport',
    price: 20.0,
    unit: 'time'
  },
  {
    name: 'Drop-off at airport',
    summary: 'Drop-off at airport',
    price: 20.0,
    unit: 'time'
  },
  {
    name: 'Pick-up at train station',
    summary: 'Pick-up at train station',
    price: 10.0,
    unit: 'time'
  },
  {
    name: 'Drop-off at train station',
    summary: 'Drop-off at train station',
    price: 10.0,
    unit: 'time'
  },
  {
    name: 'Pick-up at bus station',
    summary: 'Pick-up at bus station',
    price: 5.0,
    unit: 'time'
  },
  {
    name: 'Drop-off at bus station',
    summary: 'Drop-off at bus station',
    price: 5.0,
    unit: 'time'
  },
  { name: 'Airport lounge access', summary: 'Access to airport lounge', price: 15.0, unit: 'time' },
  { name: 'Private driver service', summary: 'Private driver for the day', price: 50.0, unit: 'day' },
  { name: 'VIP room service', summary: 'Private VIP room service', price: 100.0, unit: 'day' },
  { name: 'Sightseeing tour', summary: 'Guided sightseeing tour', price: 30.0, unit: 'time' },
  { name: 'Massage service', summary: 'In-room massage service', price: 40.0, unit: 'time' },
  { name: 'Grocery delivery', summary: 'Grocery delivery to room', price: 25.0, unit: 'delivery' },
  { name: 'Breakfast in bed', summary: 'Delivered to your room', price: 15.0, unit: 'time' },
  { name: 'Car rental', summary: 'Rent a car for the day', price: 60.0, unit: 'day' },
  { name: 'Special event decoration', summary: 'Decorate for special events', price: 75.0, unit: 'event' },
  { name: 'Personal shopping service', summary: 'Personal shopper for the day', price: 80.0, unit: 'day' }
]

additional_services.each do |additional_service|
  additional_service[:unit] = additional_service[:unit].titleize
  AdditionalService.find_or_create_by!(additional_service)
end
