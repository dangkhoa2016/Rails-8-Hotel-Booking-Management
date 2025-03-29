class BookingAdditionalService < ApplicationRecord
  belongs_to :booking
  belongs_to :additional_service
  belongs_to :reservation


  validates :additional_service_id, :booking_id, :reservation_id, :unit, presence: true
  validates :quantity, :total_price, presence: true, numericality: { greater_than: 0 }


  def to_s
    "Booking ##{booking_id} - Additional Service ##{additional_service_id}"
  end
end
