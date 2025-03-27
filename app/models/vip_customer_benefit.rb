class VipCustomerBenefit < ApplicationRecord
  belongs_to :customer


  enum :discount_type, { percent: 0, amount: 1 }
  enum :status, { inactive: 0, active: 1 }


  def to_s
    "Customer: #{customer&.name} <> #{discount_type.humanize}"
  end
end
