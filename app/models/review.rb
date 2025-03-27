class Review < ApplicationRecord
  belongs_to :customer
  belongs_to :room

  enum :status, { inactive: 0, active: 1 }


  def to_s
    "Review ##{id} - Customer: #{customer&.name}"
  end
end
