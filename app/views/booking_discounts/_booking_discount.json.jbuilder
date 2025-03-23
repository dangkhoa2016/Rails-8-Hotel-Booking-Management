json.extract! booking_discount, :id, :booking_id, :discount_type, :discount_percent, :discount_amount, :promotion_id, :reason_for_discount, :note, :created_at, :updated_at
json.url booking_discount_url(booking_discount, format: :json)
