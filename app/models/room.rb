class Room < ApplicationRecord
  belongs_to :room_type
  belongs_to :hotel_location

  has_many :bookings
  has_many :facilities_rooms
  has_many :facilities, through: :facilities_rooms


  enum :status, { inactive: 0, active: 1 }


  validates :name, :status, presence: true
  validates :name, uniqueness: { scope: [:room_type_id, :hotel_location_id] }
  validates :capacity, :price, presence: true, numericality: { greater_than: 0 }


  def to_s
    name
  end
end
