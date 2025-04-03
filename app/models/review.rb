class Review < ApplicationRecord
  belongs_to :customer
  belongs_to :room

  enum :status, { inactive: 0, active: 1 }


  validates :status, :comment, presence: true
  validates :room_rating, :service_rating,
    presence: true, numericality: { greater_than: 0, less_than_or_equal_to: 10 }


  def to_s
    self.class.human_attribute_name(:card_title, {
      room_rating: room_rating,
      customer: customer&.name
    })
  end
end
