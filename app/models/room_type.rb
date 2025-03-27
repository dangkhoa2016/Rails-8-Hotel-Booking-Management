class RoomType < ApplicationRecord
  has_many :rooms


  enum :status, { inactive: 0, active: 1 }


  def to_s
    name
  end
end
