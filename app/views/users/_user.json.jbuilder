json.extract! user, :id, :email, :encrypted_password, :role, :reset_password_token, :reset_password_sent_at, :remember_created_at, :created_at, :updated_at
json.url user_url(user, format: :json)
