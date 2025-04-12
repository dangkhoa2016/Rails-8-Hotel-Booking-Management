class AdditionalService < ApplicationRecord
  has_many :booking_additional_services
  has_many :bookings, through: :booking_additional_services


  enum :status, { inactive: 0, active: 1 }


  validates :name, :status, :summary, :unit, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }


  def to_s
    name
  end
end
