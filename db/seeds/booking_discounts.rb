@promotions = Promotion.all

def get_discount_info(booking)
  use_promotion = rand > 0.5
  promotion_id = nil
  if use_promotion
    promotion = @promotions.sample
    promotion_id = promotion.id
    reason_for_discount = "Use promotion: #{promotion.name}"
    discount_type = promotion.discount_percent.present? && promotion.discount_percent > 0 ? :percent : :amount
    discount_percent = promotion.discount_percent
    discount_amount = promotion.discount_amount
  else
    discount_type = rand > 0.5 ? :percent : :amount
    if discount_type == :percent
      discount_percent = rand(10..60)
      reason_for_discount = "Use discount percent: #{discount_percent}%"
    else
      discount_amount = rand(50..300)
      reason_for_discount = "Use discount amount: $#{discount_amount}"
    end
  end

  note = if rand > 0.5
    "Some note for discount"
  elsif rand > 0.5
    "for customer: #{booking.customer.name}"
  else
    nil
  end

  {
    discount_type: discount_type,
    discount_percent: discount_percent,
    discount_amount: discount_amount,
    promotion_id: promotion_id,
    reason_for_discount: reason_for_discount,
    note: note
  }
end

Booking.all.each do |booking|
  next if rand < 0.7

  number_of_discounts = rand(1..3)
  discounts = []
  number_of_discounts.times do
    discounts << get_discount_info(booking)
  end
  no_promotion_discounts = discounts.select { |discount| discount[:promotion_id].nil? }
  discounts = discounts.uniq { |discount| discount[:promotion_id] }
  discounts = discounts + no_promotion_discounts

  discounts.each do |discount|
    created_at = booking.created_at.since(rand(100..10000).minutes)

    BookingDiscount.new(
      booking_id: booking.id,
      discount_type: discount[:discount_type],
      discount_percent: discount[:discount_percent],
      discount_amount: discount[:discount_amount],
      promotion_id: discount[:promotion_id],
      reason_for_discount: discount[:reason_for_discount],
      note: discount[:note],
      created_at: created_at,
      updated_at: created_at.since(rand(100..10000).minutes),
    ).save! rescue nil
  end
end
