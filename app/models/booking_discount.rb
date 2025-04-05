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

    def display_at_show_page_and_form_columns
      [
        {
          name: :booking_id,
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
          name: :reason_for_discount,
          css_class: "col-12"
        },
        {
          name: :promotion_id,
          css_class: "col-md-6"
        },
        {
          name: :note,
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
      booking_id: booking_id
    })
  end

  private

  def at_least_one_discount_present
    if discount_percent.blank? && discount_amount.blank?
      errors.add(:base, :at_least_one_discount_present)
    end
  end
end
