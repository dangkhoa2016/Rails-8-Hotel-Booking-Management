class SpecialRequest < ApplicationRecord
  belongs_to :booking
  belongs_to :reservation


  validates :request, presence: true
  validates :request, uniqueness: { scope: [ :booking_id, :reservation_id ], message: "has already been requested for this booking" }
  validates :price, presence: true, numericality: { greater_than: 0 }


  class << self
    def display_at_index_page_columns
      %w[booking_id reservation_id request price]
    end
  end


  def to_s
    self.class.human_attribute_name(:card_title, {
      booking_id: booking_id,
      id: id
    })
  end
end
