class Room < ApplicationRecord
  belongs_to :room_type
  belongs_to :hotel_location

  has_many :bookings
  has_many :facilities_rooms
  has_many :facilities, through: :facilities_rooms


  enum :status, { inactive: 0, active: 1 }


  validates :name, :status, presence: true
  validates :name, uniqueness: { scope: [ :room_type_id, :hotel_location_id ] }
  validates :capacity, :price, presence: true, numericality: { greater_than: 0 }


  class << self
    def display_at_index_page_columns
      %w[name room_type_id hotel_location_id capacity price available status]
    end

    def display_at_show_page_and_form_columns
      [
        {
          name: :name,
          css_class: "col-md-6"
        },
        {
          name: :capacity,
          css_class: "col-md-6"
        },
        {
          name: :summary,
          css_class: "col-12"
        },
        {
          name: :room_type_id,
          css_class: "col-md-6"
        },
        {
          name: :hotel_location_id,
          css_class: "col-md-6"
        },
        {
          name: :price,
          css_class: "col-md-6"
        },
        {
          name: :available,
          css_class: "col-md-6"
        },
        {
          name: :half_day_price_morning,
          css_class: "col-md-6"
        },
        {
          name: :half_day_price_afternoon,
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
