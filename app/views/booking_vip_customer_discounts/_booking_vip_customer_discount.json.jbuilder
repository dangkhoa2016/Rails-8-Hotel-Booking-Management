json.extract! booking_vip_customer_discount, :id, :booking_id, :customer_id, :discount_type, :discount_percent_on_room_price, :discount_percent_on_additional_services, :discount_amount_on_room_price, :discount_amount_on_additional_services, :created_at, :updated_at
json.url booking_vip_customer_discount_url(booking_vip_customer_discount, format: :json)
