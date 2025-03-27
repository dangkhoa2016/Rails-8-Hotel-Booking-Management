class BookingAdditionalService < ApplicationRecord
  belongs_to :additional_service
  belongs_to :reservation


  def to_s
    "Booking ##{booking_id} - Additional Service ##{additional_service_id}"
  end
end
