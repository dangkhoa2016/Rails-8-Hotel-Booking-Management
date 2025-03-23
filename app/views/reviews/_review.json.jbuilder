json.extract! review, :id, :customer_id, :room_id, :room_rating, :service_rating, :comment, :status, :created_at, :updated_at
json.url review_url(review, format: :json)
