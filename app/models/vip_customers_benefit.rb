class VipCustomersBenefit < ApplicationRecord
  belongs_to :customer

  enum :discount_type, { percent: 0, amount: 1 }
  enum :status, { inactive: 0, active: 1 }


  validates :status, :discount_type, presence: true
  validates :discount_percent_on_room_price, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }, allow_blank: true, if: -> { discount_type == "percent" }
  validates :discount_percent_on_additional_services, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }, allow_blank: true, if: -> { discount_type == "percent" }
  validates :discount_amount_on_room_price, numericality: { greater_than_or_equal_to: 0 }, allow_blank: true, if: -> { discount_type == "amount" }
  validates :discount_amount_on_additional_services, numericality: { greater_than_or_equal_to: 0 }, allow_blank: true, if: -> { discount_type == "amount" }
  validates :customer_id, uniqueness: { scope: [:discount_type] }

  validate :at_least_one_discount_present
  validate :customer_is_vip
  validate :customer_is_active


  def to_s
    "Customer: #{customer&.name} <> #{discount_type.humanize}"
  end

  private

  def at_least_one_discount_present
    if discount_percent_on_room_price.blank? && discount_percent_on_additional_services.blank? &&
       discount_amount_on_room_price.blank? && discount_amount_on_additional_services.blank?
      errors.add(:base, "At least one discount must be present")
    end
  end

  def customer_is_vip
    unless customer&.vip?
      errors.add(:base, "Customer is not a VIP")
    end
  end

  def customer_is_active
    unless customer&.active?
      errors.add(:base, "Customer is not active")
    end
  end

  def display_at_index_page_columns
    %w[customer_id discount_type discount_percent_on_room_price discount_amount_on_room_price status]
  end
end
