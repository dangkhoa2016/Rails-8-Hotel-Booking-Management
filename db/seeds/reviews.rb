
customers = Customer.all.pluck(:id)
room_ratings = {
  1 => "The room is very bad, not clean.",
  2 => "The room is poor, with some major issues.",
  3 => "The room is somewhat bad, needs improvement.",
  4 => "The room is of decent quality, but could be better.",
  5 => "The room is average, nothing special.",
  6 => "The room is okay, clean but a bit small.",
  7 => "The room is good, comfortable and clean.",
  8 => "The room is very good, spacious and modern.",
  9 => "The room is excellent, comfortable and fully equipped.",
  10 => "The room is outstanding, everything is perfect!"
}

service_ratings = {
  1 => "The service is very bad, does not meet expectations.",
  2 => "The service is poor, the staff is not friendly.",
  3 => "The service is not up to expectations, needs improvement.",
  4 => "The service is decent, but can be improved further.",
  5 => "The service is average, nothing special.",
  6 => "The service is good, the staff is friendly.",
  7 => "The service is good, the staff is enthusiastic and helpful.",
  8 => "The service is very good, the staff is professional.",
  9 => "The service is excellent, the staff is dedicated and professional.",
  10 => "The service is outstanding, everything is perfect!"
}

comments = {
  1 => "This hotel is really bad. The room is dirty, not clean. The service is poor, and the staff is unfriendly.",
  2 => "The room has many issues, not as expected. The service is below expectations, needs a lot of improvement. I am not happy with this experience.",
  3 => "The room is okay, but could be better. The service is fairly average, and the staff could be friendlier. Overall, it's acceptable.",
  4 => "The room is okay, clean but a bit small. The service is decent, the staff is friendly but needs to improve the quality. The experience here is quite good.",
  5 => "The room is quite good, but there are still some areas that need improvement. The service is also decent, the staff is enthusiastic but sometimes lacks professionalism. It's acceptable for the price.",
  6 => "The room is good, clean, and comfortable. The service is quite good, the staff is thoughtful but sometimes not quite professional. A pleasant stay.",
  7 => "The room is beautiful and comfortable, clean. The service is okay, the staff is friendly and supportive. Everything is good, but a little improvement could be made.",
  8 => "The room is spacious, clean, and comfortable. The service is very good, the staff is professional and thoughtful. I am very satisfied with this experience.",
  9 => "The room is excellent, spacious with all necessary amenities. The service is excellent, the staff is very friendly and supportive. This is an ideal place to relax.",
  10 => "Everything is perfect. The room is beautiful, spacious, and fully equipped. The service is outstanding, the staff is friendly and very professional. I will definitely return without hesitation!"
}

Room.all.each do |room|
  next if rand > 0.7

  number_of_reviews = rand(1..5)
  number_of_reviews.times do |n|
    created_at = room.created_at + rand(10..100).days
    room_rating = rand(1..10)
    service_rating = rand(1..10)
    room_review = room_ratings[room_rating]
    service_review = service_ratings[service_rating]
    comment = comments[room_rating]

    Review.new(
      customer_id: customers.sample,
      room_id: room.id,
      room_rating: room_rating,
      service_rating: service_rating,
      comment: "#{room_review} #{service_review} #{comment}",
      created_at: created_at,
      updated_at: created_at.since(rand(100..10000).minutes),
    ).save!
  end
end
