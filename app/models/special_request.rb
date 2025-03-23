class SpecialRequest < ApplicationRecord
  belongs_to :booking
  belongs_to :room_reservation
end
