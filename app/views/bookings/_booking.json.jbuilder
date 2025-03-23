json.extract! booking, :id, :customer_id, :status, :total_price_before_discount, :total_price, :note, :discount_note, :created_at, :updated_at
json.url booking_url(booking, format: :json)
