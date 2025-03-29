class SpecialRequest < ApplicationRecord
  belongs_to :booking
  belongs_to :reservation


  validates :request, :price, presence: true
  validates :request, uniqueness: { scope: [:booking_id, :reservation_id], message: "has already been requested for this booking" }
  validates :price, numericality: { greater_than_or_equal_to: 0 }


  def to_s
    request || "Special Request ##{id}"
  end
end
