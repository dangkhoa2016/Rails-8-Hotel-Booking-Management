json.extract! room, :id, :name, :room_type_id, :hotel_location_id, :capacity, :price, :half_day_price_morning, :half_day_price_afternoon, :summary, :available, :status, :created_at, :updated_at
json.url room_url(room, format: :json)
