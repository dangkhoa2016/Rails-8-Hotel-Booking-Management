class SpecialRequest < ApplicationRecord
  belongs_to :booking
  belongs_to :reservation


  validates :request, :price, presence: true
  validates :request, uniqueness: { scope: [:booking_id, :reservation_id], message: "has already been requested for this booking" }
  validates :price, numericality: { greater_than_or_equal_to: 0 }


  def to_s
    "Special Request ##{id} - Booking ##{booking_id}"
  end

  def display_at_index_page_columns
    %w[booking_id reservation_id request price]
  end
end
