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
  validates :total_price, presence: true, numericality: { greater_than: 0 }
  validates :check_in_at, comparison: { less_than_or_equal_to: :check_out_at }, if: -> { check_in_at.present? && check_out_at.present? }
  validates :room_id, uniqueness: { scope: [:check_in_at, :check_out_at] }
  validate :room_must_be_available
  validate :room_must_be_active


  def to_s
    "Booking ##{booking_id} - Room: #{room&.name}"
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
  
  def display_at_index_page_columns
    %w[room_id booking_id check_in_at check_out_at total_price]
  end
end
