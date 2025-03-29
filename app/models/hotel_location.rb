class HotelLocation < ApplicationRecord
  has_many :rooms


  enum :status, { inactive: 0, active: 1 }


  validates :name, :status, :address, :manager_name, presence: true
  validates :name, uniqueness: true
  validates :address, uniqueness: true


  def to_s
    name
  end
end
