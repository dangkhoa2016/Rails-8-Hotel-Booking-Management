json.extract! promotion, :id, :name, :summary, :start_date, :end_date, :discount_type, :discount_percent, :discount_amount, :status, :created_at, :updated_at
json.url promotion_url(promotion, format: :json)
