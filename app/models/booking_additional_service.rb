class BookingAdditionalService < ApplicationRecord
  belongs_to :booking
  belongs_to :additional_service
  belongs_to :room_reservation
end
