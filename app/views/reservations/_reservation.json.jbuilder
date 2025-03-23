json.extract! reservation, :id, :room_id, :booking_id, :check_in_at, :check_out_at, :status, :room_price, :note, :room_occupant, :created_at, :updated_at
json.url reservation_url(reservation, format: :json)
