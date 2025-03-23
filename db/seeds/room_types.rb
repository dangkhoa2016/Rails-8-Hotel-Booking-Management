room_types = [
  { name: 'Standard Room', summary: 'Comfortable room with basic amenities', color: '#B0C4DE' },  # Light Steel Blue
  { name: 'Deluxe Room', summary: 'Spacious room with additional amenities', color: '#FFD700' },  # Gold
  { name: 'Suite', summary: 'Luxurious suite with separate living area', color: '#8A2BE2' },  # Blue Violet
  { name: 'Family Room', summary: 'Large room with multiple beds for families', color: '#FFDAB9' },  # Peach Puff
  { name: 'Honeymoon Suite', summary: 'Romantic suite for couples', color: '#FF69B4' },  # Hot Pink
  { name: 'Presidential Suite', summary: 'Luxury suite with premium amenities', color: '#800080' },  # Purple
  { name: 'Penthouse Suite', summary: 'Exclusive suite with panoramic views', color: '#20B2AA' },  # Light Sea Green
  { name: 'Villa', summary: 'Private villa with pool and garden', color: '#32CD32' },  # Lime Green
  { name: 'Bungalow', summary: 'Secluded bungalow with ocean views', color: '#87CEFA' },  # Light Sky Blue
  { name: 'Cabin', summary: 'Rustic cabin in the woods', color: '#8B4513' },  # Saddle Brown
  { name: 'Treehouse', summary: 'Unique treehouse accommodation', color: '#228B22' },  # Forest Green
  { name: 'Yurt', summary: 'Traditional yurt with modern comforts', color: '#D2691E' },  # Chocolate
  { name: 'Tent', summary: 'Spacious tent for camping adventures', color: '#F4A300' },  # Orange
  { name: 'Houseboat', summary: 'Floating houseboat on the water', color: '#1E90FF' },  # Dodger Blue
  { name: 'Castle', summary: 'Historic castle with royal charm', color: '#4B0082' },  # Indigo
  { name: 'Igloo', summary: 'Ice igloo for a winter wonderland experience', color: '#00FFFF' },  # Aqua
  { name: 'Lighthouse', summary: 'Quirky lighthouse accommodation', color: '#FF6347' },  # Tomato
  { name: 'Windmill', summary: 'Converted windmill with unique architecture', color: '#C71585' },  # Medium Violet Red
  { name: 'Cave', summary: 'Cozy cave dwelling for a unique stay', color: '#2F4F4F' },  # Dark Slate Gray
  { name: 'Riad', summary: 'Traditional riad with courtyard and pool', color: '#FF4500' },  # Orange Red
  { name: 'Ranch', summary: 'Western-style ranch with horseback riding', color: '#D2B48C' },  # Tan
  { name: 'Farmstay', summary: 'Farm accommodation with fresh produce', color: '#9ACD32' },  # Yellow Green
  { name: 'Safari Tent', summary: 'Luxury tent for a safari experience', color: '#DEB887' },  # Burlywood
  { name: 'Boat', summary: 'Houseboat or yacht for a nautical adventure', color: '#4682B4' },  # Steel Blue
  { name: 'Train Carriage', summary: 'Converted train carriage for a unique stay', color: '#B22222' },  # Firebrick
  { name: 'Cottage', summary: 'Quaint cottage in the countryside', color: '#FFF5EE' },  # Sea Shell
  { name: 'Apartment', summary: 'Self-contained apartment for longer stays', color: '#808080' },  # Gray
  { name: 'Hostel', summary: 'Budget-friendly accommodation with shared facilities', color: '#7FFF00' },  # Chartreuse
  { name: 'Capsule Hotel', summary: 'Compact sleeping pods for solo travelers', color: '#C0C0C0' },  # Silver
  { name: 'Glamping Tent', summary: 'Luxury tent with hotel-style amenities', color: '#A52A2A' }  # Brown
]

room_types.each do |room_type|
  RoomType.find_or_create_by!(room_type)
end
