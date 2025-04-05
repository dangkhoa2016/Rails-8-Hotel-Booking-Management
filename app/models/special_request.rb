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

    def display_at_show_page_and_form_columns
      [
        {
          name: :booking_id,
          css_class: "col-md-6"
        },
        {
          name: :reservation_id,
          css_class: "col-md-6"
        },
        {
          name: :request,
          css_class: "col-12"
        },
        {
          name: :price,
          css_class: "col-md-6 me-2"
        }
      ]
    end
  end


  def to_s
    self.class.human_attribute_name(:card_title, {
      booking_id: booking_id,
      id: id
    })
  end
end
