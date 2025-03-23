class Promotion < ApplicationRecord
  enum :discount_type, { percent: 0, amount: 1 }
  enum :status, { inactive: 0, active: 1 }
end
