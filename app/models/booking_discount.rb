class BookingDiscount < ApplicationRecord
  belongs_to :booking
  belongs_to :promotion
end
