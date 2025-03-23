class Facility < ApplicationRecord
  has_many :facilities_rooms
  has_many :rooms, through: :facilities_rooms
end
