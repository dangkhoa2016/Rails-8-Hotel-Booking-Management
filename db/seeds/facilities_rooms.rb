facilities = Facility.all.to_a

Room.all.each do |room|
  facilities.sample(rand(3..9)).each do |facility|
    room.facilities << facility
  end
end
