class AdditionalService < ApplicationRecord
  has_many :booking_additional_services
  has_many :bookings, through: :booking_additional_services


  enum :status, { inactive: 0, active: 1 }


  validates :name, :status, :summary, :unit, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }


  class << self
    def display_at_index_page_columns
      %w[name summary price unit status]
    end

    def display_at_show_page_and_form_columns
      [
        {
          name: :name,
          css_class: "col-12"
        },
        {
          name: :summary,
          css_class: "col-12"
        },
        {
          name: :price,
          css_class: "col-md-6"
        },
        {
          name: :unit,
          css_class: "col-md-6"
        },
        {
          name: :status,
          css_class: "col-12"
        }
      ]
    end
  end


  def to_s
    name
  end
end
