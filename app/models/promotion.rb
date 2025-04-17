class Promotion < ApplicationRecord
  enum :discount_type, { percent: 0, amount: 1 }
  enum :status, { inactive: 0, active: 1 }
  has_many :booking_discounts


  validates :name, :status, :discount_type, :summary, :start_date, :end_date, presence: true
  validates :start_date, comparison: { less_than_or_equal_to: :end_date }, if: -> { start_date.present? && end_date.present? }
  validates :discount_percent, numericality: { greater_than: 0, less_than_or_equal_to: 100 }, allow_blank: true, if: -> { discount_type == "percent" }
  validates :discount_amount, numericality: { greater_than: 0 }, allow_blank: true, if: -> { discount_type == "amount" }
  validates :name, uniqueness: true
  validate :at_least_one_discount_present


  class << self
    def display_at_index_page_columns
      %w[name summary start_date end_date discount_type discount_percent status]
    end

    def display_at_show_page_and_form_columns
      [
        {
          name: :name,
          css_class: "col-md-6"
        },
        {
          name: :discount_type,
          css_class: "col-md-6"
        },
        {
          name: :discount_percent,
          css_class: "col-md-6"
        },
        {
          name: :discount_amount,
          css_class: "col-md-6"
        },
        {
          name: :summary,
          css_class: "col-md-12"
        },
        {
          name: :start_date,
          css_class: "col-md-6"
        },
        {
          name: :end_date,
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
    if discount_type == "percent"
      discount_value = discount_percent.display_as_percentage
      discount_icon = "percent"
    else
      discount_value = discount_amount.display_as_money
      discount_icon = "cash-coin"
    end

    self.class.human_attribute_name(:card_title, {
      discount_icon: discount_icon,
      discount_value: discount_value,
      name: name
    })
  end

  private

  def at_least_one_discount_present
    if discount_percent.blank? && discount_amount.blank?
      errors.add(:base, :at_least_one_discount_present)
    end
  end
end
