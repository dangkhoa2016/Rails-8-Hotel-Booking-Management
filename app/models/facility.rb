class Facility < ApplicationRecord
  has_many :facilities_rooms
  has_many :rooms, through: :facilities_rooms


  enum :status, { inactive: 0, active: 1 }


  def to_s
    name
  end
end
