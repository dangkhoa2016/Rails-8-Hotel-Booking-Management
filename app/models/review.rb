class Review < ApplicationRecord
  belongs_to :customer
  belongs_to :room

  enum :status, { inactive: 0, active: 1 }


  validates :status, :comment, presence: true
  validates :room_rating, :service_rating,
    presence: true, numericality: { greater_than: 0, less_than_or_equal_to: 10 }


  class << self
    def display_at_show_page_and_form_columns
      [
        {
          name: :customer_id,
          css_class: "col-md-6"
        },
        {
          name: :room_id,
          css_class: "col-md-6"
        },
        {
          name: :room_rating,
          css_class: "col-md-6"
        },
        {
          name: :service_rating,
          css_class: "col-md-6"
        },
        {
          name: :comment,
          css_class: "col-12"
        },
        {
          name: :status,
          css_class: "col-12"
        }
      ]
    end
  end


  def to_s
    self.class.human_attribute_name(:card_title, {
      room_rating: room_rating,
      customer: customer&.name
    })
  end
end
