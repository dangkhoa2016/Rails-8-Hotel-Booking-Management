class HotelLocation < ApplicationRecord
  has_many :rooms


  enum :status, { inactive: 0, active: 1 }
end
