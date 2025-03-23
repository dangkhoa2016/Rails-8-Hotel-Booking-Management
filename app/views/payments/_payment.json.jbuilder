json.extract! payment, :id, :booking_id, :amount, :payment_date, :payment_method, :payment_type, :note, :created_at, :updated_at
json.url payment_url(payment, format: :json)
