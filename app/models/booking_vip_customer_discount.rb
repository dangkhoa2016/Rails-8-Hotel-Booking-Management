class BookingVipCustomerDiscount < ApplicationRecord
  belongs_to :booking
  belongs_to :customer
end
