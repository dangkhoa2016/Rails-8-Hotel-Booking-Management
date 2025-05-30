class BookingAdditionalService < ApplicationRecord
  belongs_to :additional_service
  belongs_to :reservation


  validates :additional_service_id, :reservation_id, :unit, presence: true
  validates :quantity, :total_price, presence: true, numericality: { greater_than: 0 }


  class << self
    def display_at_index_page_columns
      %w[additional_service_id reservation_id quantity total_price]
    end
  end


  def to_s
    self.class.human_attribute_name(:card_title, {
      reservation_id: reservation_id,
      additional_service_id: additional_service_id
    })
  end

  def summary
    [
      BookingAdditionalService.human_attribute_name(:quantity) + ": #{quantity}",
      BookingAdditionalService.human_attribute_name(:unit) + ": #{unit}",
      BookingAdditionalService.human_attribute_name(:total_price) + ": #{total_price.display_as_money}"
    ].join("\n")
  end
end
