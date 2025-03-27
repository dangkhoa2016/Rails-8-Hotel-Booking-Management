class SpecialRequest < ApplicationRecord
  belongs_to :booking
  belongs_to :reservation


  def to_s
    request || "Special Request ##{id}"
  end
end
