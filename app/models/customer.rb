class Customer < ApplicationRecord
  has_many :bookings
  has_many :vip_customers_benefits

  enum :customer_type, { normal: 0, vip: 1 }
  enum :status, { inactive: 0, active: 1 }


  validates :name, presence: true
  validates :status, :customer_type, presence: true
  validates :name, uniqueness: { scope: :email, message: "must be unique" }, if: -> { email.present? }
  validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }, allow_blank: true
  validates :phone_number, format: { with: /\A[\-\s\d\.]+\z/ }, allow_blank: true


  class << self
    def display_at_index_page_columns
      %w[name email phone_number address customer_type status]
    end

    def display_at_show_page_and_form_columns
      [
        {
          name: :name,
          css_class: "col-md-6"
        },
        {
          name: :customer_type,
          css_class: "col-md-6"
        },
        {
          name: :email,
          css_class: "col-md-6"
        },
        {
          name: :phone_number,
          css_class: "col-md-6"
        },
        {
          name: :address,
          css_class: "col-12"
        },
        {
          name: :note,
          css_class: "col-12"
        },
        {
          name: :status,
          css_class: "col-12"
        }
      ]
    end
  end


  def to_s
    name
  end
end
