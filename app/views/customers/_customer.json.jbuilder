json.extract! customer, :id, :name, :email, :phone_number, :address, :note, :status, :customer_type, :created_at, :updated_at
json.url customer_url(customer, format: :json)
