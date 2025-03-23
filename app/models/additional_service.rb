class AdditionalService < ApplicationRecord
  has_many :booking_additional_services
  has_many :bookings, through: :booking_additional_services
end
