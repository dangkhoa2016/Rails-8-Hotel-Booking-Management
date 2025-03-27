class BookingDiscount < ApplicationRecord
  belongs_to :booking
  belongs_to :promotion, optional: true

  enum :discount_type, { percent: 0, amount: 1 }


  validates :discount_type, presence: true
  validates :discount_percent, numericality: { greater_than: 0, less_than_or_equal_to: 100 }, allow_blank: true, if: -> { discount_type == "percent" }
  validates :discount_amount, numericality: { greater_than: 0 }, allow_blank: true, if: -> { discount_type == "amount" }
  validates :reason_for_discount, presence: true, if: -> { discount_type == "amount" }
  validates :booking_id, uniqueness: { scope: [ :discount_type, :discount_percent, :discount_amount ] }

  # Custom validation to ensure that either discount_percent or discount_amount is present
  validate :at_least_one_discount_present


  class << self
    def display_at_index_page_columns
      %w[booking_id discount_type discount_percent discount_amount reason_for_discount]
    end
  end


  def to_s
    reason_for_discount || "Discount ##{id}"
  end

  private

  def at_least_one_discount_present
    if discount_percent.blank? && discount_amount.blank?
      errors.add(:base, :at_least_one_discount_present)
    end
  end
end
