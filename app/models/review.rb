class Review < ApplicationRecord
  belongs_to :customer
  belongs_to :room

  enum :status, { inactive: 0, active: 1 }
end
