class VipCustomersBenefit < ApplicationRecord
  belongs_to :customer


  enum :discount_type, { percent: 0, amount: 1 }
  enum :status, { inactive: 0, active: 1 }
end
