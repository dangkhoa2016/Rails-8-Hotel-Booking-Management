class Customer < ApplicationRecord
  has_many :bookings
  has_many :vip_customer_benefits


  enum :customer_type, { normal: 0, vip: 1 }
  enum :status, { inactive: 0, active: 1 }


  def to_s
    name
  end
end
