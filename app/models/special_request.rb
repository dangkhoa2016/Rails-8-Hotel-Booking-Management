class SpecialRequest < ApplicationRecord
  belongs_to :reservation


  validates :request, presence: true
  validates :request, uniqueness: { scope: [ :reservation_id ], message: "has already been requested for this reservation" }
  validates :price, presence: true, numericality: { greater_than: 0 }


  class << self
    def display_at_index_page_columns
      %w[reservation_id request price]
    end
  end


  def to_s
    self.class.human_attribute_name(:card_title, {
      reservation_id: reservation_id,
      id: id
    })
  end
end
