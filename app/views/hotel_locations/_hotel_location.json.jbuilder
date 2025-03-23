json.extract! hotel_location, :id, :name, :address, :manager_name, :status, :created_at, :updated_at
json.url hotel_location_url(hotel_location, format: :json)
