class Promotion < ApplicationRecord
  enum :discount_type, { percent: 0, amount: 1 }
end
