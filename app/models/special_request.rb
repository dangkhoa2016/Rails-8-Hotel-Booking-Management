class SpecialRequest < ApplicationRecord
  belongs_to :booking
  belongs_to :reservation


  validates :request, presence: true
  validates :request, uniqueness: { scope: [ :booking_id, :reservation_id ], message: "has already been requested for this booking" }
  validates :price, presence: true, numericality: { greater_than: 0 }


  def to_s
    request || "Special Request ##{id}"
  end
end
