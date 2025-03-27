class Promotion < ApplicationRecord
  enum :discount_type, { percent: 0, amount: 1 }
  enum :status, { inactive: 0, active: 1 }


  validates :name, :status, :discount_type, :summary, :start_date, :end_date, presence: true
  validates :start_date, comparison: { less_than_or_equal_to: :end_date }, if: -> { start_date.present? && end_date.present? }
  validates :discount_percent, numericality: { greater_than: 0, less_than_or_equal_to: 100 }, allow_blank: true, if: -> { discount_type == "percent" }
  validates :discount_amount, numericality: { greater_than: 0 }, allow_blank: true, if: -> { discount_type == "amount" }
  validates :name, uniqueness: true
  validate :at_least_one_discount_present


  def to_s
    name
  end

  private

  def at_least_one_discount_present
    if discount_percent.blank? && discount_amount.blank?
      errors.add(:base, :at_least_one_discount_present)
    end
  end

  def display_at_index_page_columns
    %w[name summary start_date end_date discount_type discount_percent status]
  end
end
