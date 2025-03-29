class BookingAdditionalService < ApplicationRecord
  belongs_to :booking
  belongs_to :additional_service
  belongs_to :reservation


  validates :additional_service_id, :booking_id, :reservation_id, :unit, presence: true
  validates :quantity, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }


  def to_s
    "Booking ##{booking_id} - Additional Service ##{additional_service_id}"
  end
end
