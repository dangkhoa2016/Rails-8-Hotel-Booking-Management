class BookingDiscount < ApplicationRecord
  belongs_to :booking
  belongs_to :promotion, optional: true


  enum :discount_type, { percent: 0, amount: 1 }


  def to_s
    reason_for_discount || "Discount ##{id}"
  end
end
