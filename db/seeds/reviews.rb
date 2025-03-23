
customers = Customer.all.pluck(:id)
room_ratings = {
  1 => "Phòng rất tệ, không sạch sẽ.",
  2 => "Phòng kém, có một số vấn đề lớn.",
  3 => "Phòng hơi tệ, cần cải thiện.",
  4 => "Phòng có chất lượng ổn, nhưng có thể tốt hơn.",
  5 => "Phòng bình thường, không có gì nổi bật.",
  6 => "Phòng ổn, sạch sẽ nhưng hơi nhỏ.",
  7 => "Phòng tốt, thoải mái và sạch sẽ.",
  8 => "Phòng rất tốt, rộng rãi và hiện đại.",
  9 => "Phòng tuyệt vời, thoải mái và đầy đủ tiện nghi.",
  10 => "Phòng xuất sắc, mọi thứ đều hoàn hảo!"
}

service_ratings = {
  1 => "Dịch vụ rất tệ, không đáp ứng được yêu cầu.",
  2 => "Dịch vụ kém, nhân viên không thân thiện.",
  3 => "Dịch vụ chưa đạt yêu cầu, cần cải thiện.",
  4 => "Dịch vụ ổn, nhưng có thể cải thiện thêm.",
  5 => "Dịch vụ bình thường, không có gì đặc biệt.",
  6 => "Dịch vụ tốt, nhân viên có thái độ thân thiện.",
  7 => "Dịch vụ tốt, nhân viên nhiệt tình và hỗ trợ.",
  8 => "Dịch vụ rất tốt, nhân viên chuyên nghiệp.",
  9 => "Dịch vụ xuất sắc, nhân viên rất tận tâm và chuyên nghiệp.",
  10 => "Dịch vụ tuyệt vời, mọi thứ đều hoàn hảo!"
}

comments = {
  1 => "Khách sạn này thật sự rất tệ. Phòng ốc bẩn, không sạch sẽ. Dịch vụ thì kém và nhân viên không thân thiện.",
  2 => "Phòng có nhiều vấn đề, không được như mong đợi. Dịch vụ chưa đạt yêu cầu, cần cải thiện nhiều. Không hài lòng với trải nghiệm lần này.",
  3 => "Phòng ổn, nhưng có thể tốt hơn. Dịch vụ khá bình thường, nhân viên có thể thân thiện hơn. Nói chung là chấp nhận được.",
  4 => "Phòng ổn, sạch sẽ nhưng hơi nhỏ. Dịch vụ ở mức khá, nhân viên thân thiện nhưng cần nâng cao chất lượng. Trải nghiệm ở đây khá tốt.",
  5 => "Phòng khá tốt, nhưng vẫn có một số điểm cần cải thiện. Dịch vụ cũng ổn, nhân viên nhiệt tình nhưng đôi lúc thiếu chuyên nghiệp. Chấp nhận được với mức giá.",
  6 => "Phòng tốt, sạch sẽ, có không gian thoải mái. Dịch vụ khá tốt, nhân viên chu đáo nhưng đôi lúc vẫn chưa thực sự chuyên nghiệp. Một kỳ nghỉ dễ chịu.",
  7 => "Phòng đẹp và thoải mái, sạch sẽ. Dịch vụ ổn, nhân viên thân thiện và hỗ trợ nhiệt tình. Mọi thứ đều khá tốt nhưng vẫn có thể cải thiện chút xíu.",
  8 => "Phòng rộng rãi, sạch sẽ và thoải mái. Dịch vụ rất tốt, nhân viên chuyên nghiệp và chu đáo. Rất hài lòng với trải nghiệm lần này.",
  9 => "Phòng tuyệt vời, không gian rộng rãi và tiện nghi đầy đủ. Dịch vụ tuyệt vời, nhân viên rất thân thiện và hỗ trợ nhiệt tình. Đây là một nơi lý tưởng để nghỉ ngơi.",
  10 => "Mọi thứ đều hoàn hảo. Phòng đẹp, rộng rãi và đầy đủ tiện nghi. Dịch vụ tuyệt vời, nhân viên thân thiện và rất chuyên nghiệp. Tôi sẽ quay lại đây lần sau mà không cần suy nghĩ!"
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
