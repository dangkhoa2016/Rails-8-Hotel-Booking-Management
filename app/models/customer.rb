class Customer < ApplicationRecord
  has_many :bookings
  has_many :vip_customers_benefits


  enum :customer_type, { normal: 0, vip: 1 }
end
