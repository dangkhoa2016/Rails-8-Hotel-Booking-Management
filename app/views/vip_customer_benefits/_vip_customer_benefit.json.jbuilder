json.extract! vip_customer_benefit, :id, :customer_id, :discount_type, :discount_percent_on_room_price, :discount_percent_on_additional_services, :discount_amount_on_room_price, :discount_amount_on_additional_services, :status, :created_at, :updated_at
json.url vip_customer_benefit_url(vip_customer_benefit, format: :json)
