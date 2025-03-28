class Review < ApplicationRecord
  belongs_to :customer
  belongs_to :room

  enum :status, { inactive: 0, active: 1 }


  validates :status, :comment, presence: true
  validates :room_rating, :service_rating,
    presence: true, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 10 }


  def to_s
    "Review ##{id} - Customer: #{customer&.name}"
  end
end
