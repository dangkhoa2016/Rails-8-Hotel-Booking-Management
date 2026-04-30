class Booking < ApplicationRecord
  before_validation :calculate_prices
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
  validates :total_price_before_discount, presence: true, numericality: { greater_than_or_equal_to: 0 }
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

  def calculate_prices(force: false)
    return unless force || pricing_inputs_present?

    reservations_total = active_reservations.sum { |reservation| reservation.calculate_total_price.to_d }
    services_total = active_booking_additional_services.sum { |service| service.total_price.to_d }
    subtotal = reservations_total + services_total

    self.total_price_before_discount = subtotal
    self.total_price = [ subtotal - total_discount_amount(reservations_total:, services_total:, subtotal:), 0.to_d ].max
  end

  def recalculate_totals!
    calculate_prices(force: true)
    save!
  end

  private

  def active_reservations
    reservations.reject(&:marked_for_destruction?)
  end

  def active_booking_additional_services
    booking_additional_services.reject(&:marked_for_destruction?)
  end

  def active_booking_discounts
    booking_discounts.reject(&:marked_for_destruction?)
  end

  def active_booking_vip_customer_discounts
    booking_vip_customer_discounts.reject(&:marked_for_destruction?)
  end

  def pricing_inputs_present?
    active_reservations.any? || active_booking_additional_services.any? || active_booking_discounts.any? || active_booking_vip_customer_discounts.any?
  end

  def total_discount_amount(reservations_total:, services_total:, subtotal:)
    booking_discounts_total = active_booking_discounts.sum do |discount|
      if discount.discount_type == "percent"
        subtotal * ((discount.discount_percent || discount.promotion&.discount_percent || 0).to_d / 100)
      else
        (discount.discount_amount || discount.promotion&.discount_amount || 0).to_d
      end
    end

    vip_discounts_total = active_booking_vip_customer_discounts.sum do |discount|
      if discount.discount_type == "percent"
        reservations_total * (discount.discount_percent_on_room_price.to_d / 100) +
          services_total * (discount.discount_percent_on_additional_services.to_d / 100)
      else
        discount.discount_amount_on_room_price.to_d + discount.discount_amount_on_additional_services.to_d
      end
    end

    booking_discounts_total + vip_discounts_total
  end
end
