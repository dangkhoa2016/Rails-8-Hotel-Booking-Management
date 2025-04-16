class BookingVipCustomerDiscount < ApplicationRecord
  belongs_to :booking
  belongs_to :customer

  enum :discount_type, { percent: 0, amount: 1 }


  validates :discount_type, presence: true
  validates :discount_percent_on_room_price, numericality: { greater_than: 0, less_than_or_equal_to: 100 }, allow_blank: true, if: -> { discount_type == "percent" }
  validates :discount_percent_on_additional_services, numericality: { greater_than: 0, less_than_or_equal_to: 100 }, allow_blank: true, if: -> { discount_type == "percent" }
  validates :discount_amount_on_room_price, numericality: { greater_than: 0 }, allow_blank: true, if: -> { discount_type == "amount" }
  validates :discount_amount_on_additional_services, numericality: { greater_than: 0 }, allow_blank: true, if: -> { discount_type == "amount" }
  validates :booking_id, uniqueness: { scope: [ :customer_id, :discount_type ] }

  # Custom validation to ensure that either discount_percent or discount_amount is present
  validate :at_least_one_discount_present


  class << self
    def display_at_index_page_columns
      %w[booking_id customer_id discount_type discount_percent_on_room_price discount_amount_on_room_price]
    end
  end


  def to_s
    "Booking ##{booking_id} - Customer ##{customer_id}"
  end

  def summary
    if discount_type == "percent"
      [
        BookingDiscount.human_attribute_name("discount_percent_on_room_price") + ": #{discount_percent_on_room_price.display_as_percentage}",
        BookingDiscount.human_attribute_name("discount_percent_on_additional_services") + ": #{discount_percent_on_additional_services.display_as_percentage}"
      ].join("\n")
    else
      [
        BookingDiscount.human_attribute_name("discount_amount_on_room_price") + ": #{discount_amount_on_room_price.display_as_money}",
        BookingDiscount.human_attribute_name("discount_amount_on_additional_services") + ": #{discount_amount_on_additional_services.display_as_money}"
      ].join("\n")
    end
  end

  private

  def at_least_one_discount_present
    if discount_percent_on_room_price.blank? && discount_percent_on_additional_services.blank? &&
        discount_amount_on_room_price.blank? && discount_amount_on_additional_services.blank?
      errors.add(:base, "At least one discount must be present")
    end
  end
end
