class Booking < ApplicationRecord
  belongs_to :customer

  has_many :booking_additional_services
  has_many :additional_services, through: :booking_additional_services
  has_many :booking_discounts
  has_many :promotions, through: :booking_discounts
  has_many :reservations
  has_many :rooms, through: :reservations
  has_many :special_requests
  has_many :vip_customers_benefits, through: :customer
  has_many :booking_vip_customer_discounts


  enum :status, {
    pending: 0,
    confirmed: 1,
    checked_in: 2,
    checked_out: 3,
    canceled: 4,
    no_show: 5,
    in_progress: 6,
    refunded: 7,
    rescheduled: 8,
    overdue: 9,
    waiting_for_payment: 10,
  }


  def to_s
    "Booking ##{id} - Customer: #{customer&.name}"
  end

  def display_at_index_page_columns
    %w[customer_id total_price_before_discount total_price note discount_note status]
  end
end
