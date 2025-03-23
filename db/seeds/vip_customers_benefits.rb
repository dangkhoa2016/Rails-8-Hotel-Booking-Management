
def get_discount_info
  discount_type = rand(0..1)
  discount_percent_on_room_price = discount_percent_on_additional_services = discount_amount_on_room_price = discount_amount_on_additional_services = nil
  if discount_type == :percent
    discount_percent_on_room_price = rand(0..50)
    discount_percent_on_additional_services = rand(0..50)
    if discount_percent_on_room_price.zero? && discount_percent_on_additional_services.zero?
      if rand > 0.5
        discount_percent_on_room_price = rand(5..50)
      else
        discount_percent_on_additional_services = rand(5..50)
      end
    end
  else
    discount_amount_on_room_price = rand(0..300)
    discount_amount_on_additional_services = rand(0..30)
    if discount_amount_on_room_price.zero? && discount_amount_on_additional_services.zero?
      if rand > 0.5
        discount_amount_on_room_price = rand(50..100)
      else
        discount_amount_on_additional_services = rand(5..30)
      end
    end
  end

  {
    discount_type: discount_type,
    discount_percent_on_room_price: discount_percent_on_room_price,
    discount_percent_on_additional_services: discount_percent_on_additional_services,
    discount_amount_on_room_price: discount_amount_on_room_price,
    discount_amount_on_additional_services: discount_amount_on_additional_services,
  }
end

Customer.all.each do |customer|
  next if rand > 0.4

  number_of_benefits = rand(1..3)
  benefits = []
  number_of_benefits.times do
    benefits << get_discount_info
  end

  benefits.each do |benefit|
    created_at = customer.created_at.since(rand(100..10000).minutes)

    VipCustomersBenefit.new(
      customer_id: customer.id,
      discount_type: benefit[:discount_type],
      discount_percent_on_room_price: benefit[:discount_percent_on_room_price],
      discount_percent_on_additional_services: benefit[:discount_percent_on_additional_services],
      discount_amount_on_room_price: benefit[:discount_amount_on_room_price],
      discount_amount_on_additional_services: benefit[:discount_amount_on_additional_services],
      created_at: created_at,
      updated_at: created_at.since(rand(100..10000).minutes),
    ).save!
  end
end
