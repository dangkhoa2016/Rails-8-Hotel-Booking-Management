class BookingVipCustomerDiscount < ApplicationRecord
  belongs_to :booking
  belongs_to :customer


  enum :discount_type, { percent: 0, amount: 1 }


  def to_s
    "Booking ##{booking_id} - Customer ##{customer_id}"
  end
end
