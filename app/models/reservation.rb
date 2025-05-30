class Reservation < ApplicationRecord
  belongs_to :room
  belongs_to :booking
  has_many :special_requests
  has_many :booking_additional_services


  enum :status, {
    pending: 0,
    confirmed: 1,
    checked_in: 2,
    checked_out: 3,
    canceled: 4,
    no_show: 5,
    in_progress: 6,
    overdue: 7
  }


  validates :check_in_at, :check_out_at, :status, presence: true
  validates :room_price, presence: true, numericality: { greater_than: 0 }
  validates :check_in_at, comparison: { less_than_or_equal_to: :check_out_at }, if: -> { check_in_at.present? && check_out_at.present? }
  validates :room_id, uniqueness: { scope: [ :check_in_at, :check_out_at ] }
  validate :room_must_be_available
  validate :room_must_be_active


  class << self
    def display_at_index_page_columns
      %w[room_id booking_id status check_in_at check_out_at room_price room_occupant]
    end

    def display_at_show_page_and_form_columns
      [
        {
          name: :room_id,
          css_class: "col-md-6"
        },
        {
          name: :booking_id,
          css_class: "col-md-6"
        },
        {
          name: :check_in_at,
          css_class: "col-md-6"
        },
        {
          name: :check_out_at,
          css_class: "col-md-6"
        },
        {
          name: :room_price,
          css_class: "col-md-6"
        },
        {
          name: :status,
          css_class: "col-md-6"
        },
        {
          name: :note,
          css_class: "col-12"
        },
        {
          name: :room_occupant,
          css_class: "col-12"
        }
      ]
    end
  end


  def to_s
    self.class.human_attribute_name(:card_title, {
      booking_id: booking_id,
      room: room&.name
    })
  end

  private

  def room_must_be_available
    if room.present? && !room.available?
      errors.add(:base, "Room must be available for reservation.")
    end
  end

  def room_must_be_active
    if room.present? && !room.active?
      errors.add(:base, "Room must be active for reservation.")
    end
  end
end
