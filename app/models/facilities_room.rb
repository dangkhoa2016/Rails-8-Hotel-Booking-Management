class FacilitiesRoom < ApplicationRecord
  belongs_to :room
  belongs_to :facility


  def to_s
    "Room ##{room_id} - Facility ##{facility_id}"
  end
end
