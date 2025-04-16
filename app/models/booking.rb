class Booking < ApplicationRecord
  belongs_to :customer

  has_many :reservations
  has_many :rooms, through: :reservations
  has_many :booking_additional_services, through: :reservations
  has_many :additional_services, through: :booking_additional_services
  has_many :booking_discounts
  has_many :promotions, through: :booking_discounts
  has_many :special_requests, through: :reservations
  has_many :vip_customer_benefits, through: :customer
  has_many :booking_vip_customer_discounts
  has_many :payments, -> { order(created_at: :desc) }


  enum :status, {
    pending: 0,
    confirmed: 1,
    checked_in: 2,
    checked_out: 3,
    canceled: 4,
    no_show: 5,
    in_progress: 6,
    refunded: 7,
    rescheduled: 8,
    overdue: 9,
    waiting_for_payment: 10
  }


  validates :customer_id, presence: true
  validates :total_price_before_discount, presence: true, numericality: { greater_than: 0 }
  validates :status, presence: true


  class << self
    def display_at_index_page_columns
      %w[customer_id total_price_before_discount total_price note discount_note status]
    end

    def display_at_show_page_and_form_columns
      [
        {
          name: :customer_id,
          css_class: "col-md-6"
        },
        {
          name: :status,
          css_class: "col-md-6"
        },
        {
          name: :total_price_before_discount,
          css_class: "col-md-6"
        },
        {
          name: :total_price,
          css_class: "col-md-6"
        },
        {
          name: :note,
          css_class: "col-12"
        },
        {
          name: :discount_note,
          css_class: "col-12"
        }
      ]
    end
  end


  def to_s
    self.class.human_attribute_name(:card_title, {
      id: id,
      customer: customer&.name
    })
  end

  def total_discounts
    booking_discounts.size + promotions.size + booking_vip_customer_discounts.size
  end
end
