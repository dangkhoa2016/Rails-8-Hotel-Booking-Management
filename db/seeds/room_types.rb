room_types = [
  { name: 'Standard Room', description: 'Comfortable room with basic amenities', color: '#B0C4DE' },  # Light Steel Blue
  { name: 'Deluxe Room', description: 'Spacious room with additional amenities', color: '#FFD700' },  # Gold
  { name: 'Suite', description: 'Luxurious suite with separate living area', color: '#8A2BE2' },  # Blue Violet
  { name: 'Family Room', description: 'Large room with multiple beds for families', color: '#FFDAB9' },  # Peach Puff
  { name: 'Honeymoon Suite', description: 'Romantic suite for couples', color: '#FF69B4' },  # Hot Pink
  { name: 'Presidential Suite', description: 'Luxury suite with premium amenities', color: '#800080' },  # Purple
  { name: 'Penthouse Suite', description: 'Exclusive suite with panoramic views', color: '#20B2AA' },  # Light Sea Green
  { name: 'Villa', description: 'Private villa with pool and garden', color: '#32CD32' },  # Lime Green
  { name: 'Bungalow', description: 'Secluded bungalow with ocean views', color: '#87CEFA' },  # Light Sky Blue
  { name: 'Cabin', description: 'Rustic cabin in the woods', color: '#8B4513' },  # Saddle Brown
  { name: 'Treehouse', description: 'Unique treehouse accommodation', color: '#228B22' },  # Forest Green
  { name: 'Yurt', description: 'Traditional yurt with modern comforts', color: '#D2691E' },  # Chocolate
  { name: 'Tent', description: 'Spacious tent for camping adventures', color: '#F4A300' },  # Orange
  { name: 'Houseboat', description: 'Floating houseboat on the water', color: '#1E90FF' },  # Dodger Blue
  { name: 'Castle', description: 'Historic castle with royal charm', color: '#4B0082' },  # Indigo
  { name: 'Igloo', description: 'Ice igloo for a winter wonderland experience', color: '#00FFFF' },  # Aqua
  { name: 'Lighthouse', description: 'Quirky lighthouse accommodation', color: '#FF6347' },  # Tomato
  { name: 'Windmill', description: 'Converted windmill with unique architecture', color: '#C71585' },  # Medium Violet Red
  { name: 'Cave', description: 'Cozy cave dwelling for a unique stay', color: '#2F4F4F' },  # Dark Slate Gray
  { name: 'Riad', description: 'Traditional riad with courtyard and pool', color: '#FF4500' },  # Orange Red
  { name: 'Ranch', description: 'Western-style ranch with horseback riding', color: '#D2B48C' },  # Tan
  { name: 'Farmstay', description: 'Farm accommodation with fresh produce', color: '#9ACD32' },  # Yellow Green
  { name: 'Safari Tent', description: 'Luxury tent for a safari experience', color: '#DEB887' },  # Burlywood
  { name: 'Boat', description: 'Houseboat or yacht for a nautical adventure', color: '#4682B4' },  # Steel Blue
  { name: 'Train Carriage', description: 'Converted train carriage for a unique stay', color: '#B22222' },  # Firebrick
  { name: 'Cottage', description: 'Quaint cottage in the countryside', color: '#FFF5EE' },  # Sea Shell
  { name: 'Hostel', description: 'Budget-friendly accommodation with shared facilities', color: '#7FFF00' },  # Chartreuse
  { name: 'Capsule Hotel', description: 'Compact sleeping pods for solo travelers', color: '#C0C0C0' },  # Silver
  { name: 'Glamping Tent', description: 'Luxury tent with hotel-style amenities', color: '#A52A2A' }  # Brown
]

room_types.each do |room_type|
  RoomType.find_or_create_by!(room_type)
end
