class Reservation < ApplicationRecord
  belongs_to :room
  belongs_to :booking


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
  validates :check_in_at, comparison: { less_than: :check_out_at }
  validates :room_id, uniqueness: { scope: [:check_in_at, :check_out_at] }
  validate :check_in_and_check_out_dates_must_not_overlap
  validate :room_must_be_available
  validate :room_must_be_active


  def to_s
    "Booking ##{booking_id} - Room: #{room&.name}"
  end

  private

  def check_in_and_check_out_dates_must_not_overlap
    overlapping_reservations = Reservation.where(room_id: room_id)
                                           .where.not(id: id)
                                           .where("check_in_at < ? AND check_out_at > ?", check_out_at, check_in_at)

    if overlapping_reservations.exists?
      errors.add(:base, "Check-in and check-out dates must not overlap with existing reservations.")
    end
  end

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
  
  def display_at_index_page_columns
    %w[room_id booking_id check_in_at check_out_at total_price]
  end
end
