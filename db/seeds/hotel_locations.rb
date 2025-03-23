hotel_locations = [
  {
    name: 'Head Office',
    address: '123 Main St, Springfield, IL, USA',
    manager_name: 'John Doe'
  },
  {
    name: 'Branch Office 1',
    address: '456 Elm St, Springfield, IL, USA',
    manager_name: 'Jane Smith'
  },
  {
    name: 'Branch Office 2',
    address: '789 Oak St, Hartford, CT, USA',
    manager_name: 'Alice Johnson'
  },
  {
    name: 'Branch Office 3',
    address: '101 Pine St, Trenton, NJ, USA',
    manager_name: 'Bob Brown'
  }
]

hotel_locations.each do |hotel_location|
  HotelLocation.find_or_create_by!(hotel_location)
end
