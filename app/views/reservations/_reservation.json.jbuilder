json.extract! reservation, :id, :room_id, :booking_id, :check_in_at, :check_out_at, :quantity, :status, :total_price, :note, :created_at, :updated_at
json.url reservation_url(reservation, format: :json)
