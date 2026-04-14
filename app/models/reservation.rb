class Reservation < ApplicationRecord
  before_validation :set_default_prices
  after_save :recalculate_booking_totals
  after_destroy :recalculate_booking_totals
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
  validates :room_id, presence: true
  validate :room_must_be_available, on: :create
  validate :room_must_be_active
  validate :no_overlap


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

  def set_default_prices
    self.room_price ||= room&.price
    self.total_price = calculate_total_price
  end

  def calculate_total_price
    return 0 unless room && check_in_at && check_out_at

    duration_in_hours = (check_out_at - check_in_at) / 1.hour

    if duration_in_hours <= 0
      0
    elsif duration_in_hours <= 4
      # Giả định ở dưới 4 tiếng tính nửa ngày
      if check_in_at.hour < 12
        room.half_day_price_morning || (room.price / 2)
      else
        room.half_day_price_afternoon || (room.price / 2)
      end
    else
      nights = ((check_out_at.to_date - check_in_at.to_date)).to_i
      nights = 1 if nights == 0
      nights * (room_price || room.price)
    end
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

  def no_overlap
    return unless room && check_in_at && check_out_at

    overlapping_reservations = Reservation.where(room_id: room_id)
                                         .where.not(id: id)
                                         .where.not(status: :canceled)
                                         .where("check_in_at < ? AND check_out_at > ?", check_out_at, check_in_at)

    if overlapping_reservations.exists?
      errors.add(:base, "Room is already booked for this period.")
    end
  end

  def recalculate_booking_totals
    Booking.find_by(id: booking_id)&.recalculate_totals!
  end
end
