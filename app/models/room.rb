class Room < ApplicationRecord
  belongs_to :room_type
  belongs_to :hotel_location

  has_many :bookings
  has_many :facilities_rooms
  has_many :facilities, through: :facilities_rooms


  enum :status, { inactive: 0, active: 1 }


  def to_s
    name
  end
end
