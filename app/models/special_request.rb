class SpecialRequest < ApplicationRecord
  belongs_to :reservation


  validates :request, presence: true
  validates :request, uniqueness: { scope: [ :reservation_id ], message: "has already been requested for this reservation" }
  validates :price, presence: true, numericality: { greater_than: 0 }


  class << self
    def display_at_index_page_columns
      %w[reservation_id request price]
    end

    def display_at_show_page_and_form_columns
      [
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
          css_class: "col-md-6"
        }
      ]
    end
  end


  def to_s
    self.class.human_attribute_name(:card_title, {
      reservation_id: reservation_id,
      id: id
    })
  end
end
