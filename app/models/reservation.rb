class Reservation < ApplicationRecord
  belongs_to :room
  belongs_to :booking
  has_many :special_requests
  has_many :booking_additional_services


  enum :status, {
    pending: 0,
    confirmed: 1,
    checked_in: 2,
    checked_out: 3,
    canceled: 4,
    no_show: 5,
    in_progress: 6,
    overdue: 7
  }
end
