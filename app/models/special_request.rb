class SpecialRequest < ApplicationRecord
  belongs_to :booking
  belongs_to :reservation
end
