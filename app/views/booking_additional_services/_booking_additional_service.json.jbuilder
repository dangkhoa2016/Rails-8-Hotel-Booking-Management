json.extract! booking_additional_service, :id, :additional_service_id, :reservation_id, :note, :quantity, :unit, :total_price, :created_at, :updated_at
json.url booking_additional_service_url(booking_additional_service, format: :json)
