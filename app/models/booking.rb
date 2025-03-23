class Booking < ApplicationRecord
  belongs_to :customer

  has_many :booking_additional_services
  has_many :additional_services, through: :booking_additional_services
  has_many :booking_discounts
  has_many :promotions, through: :booking_discounts
  has_many :room_reservations
  has_many :rooms, through: :room_reservations
  has_many :special_requests
  has_many :vip_customers_benefits, through: :customer
  has_many :booking_vip_customer_discounts
end
