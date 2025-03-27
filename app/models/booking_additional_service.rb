class BookingAdditionalService < ApplicationRecord
  belongs_to :additional_service
  belongs_to :reservation


  validates :additional_service_id, :reservation_id, :unit, presence: true
  validates :quantity, :total_price, presence: true, numericality: { greater_than: 0 }


  class << self
    def display_at_index_page_columns
      %w[booking_id additional_service_id reservation_id quantity total_price]
    end
  end


  def to_s
    "Reservation ##{reservation_id} - Additional Service ##{additional_service_id}"
  end
end
