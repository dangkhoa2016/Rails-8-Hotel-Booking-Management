class Payment < ApplicationRecord
  belongs_to :booking

  enum :payment_method, { cash: "cash", credit_card: "credit_card", bank_transfer: "bank_transfer", online_wallet: "online_wallet", cryptocurrency: "cryptocurrency" }
  enum :payment_type, { one_time_payment: "one_time_payment", installment_payment: "installment_payment", subscription: "subscription" }


  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :payment_date, :payment_method, :payment_type, :booking_id, presence: true
  validate :payment_date_cannot_be_in_the_future


  def to_s
    "Payment of #{amount} on #{payment_date&.strftime('%Y-%m-%d')}"
  end

  def display_at_index_page_columns
    %w[booking_id amount payment_date payment_method payment_type]
  end

  private

  def payment_date_cannot_be_in_the_future
    if payment_date.present? && payment_date > DateTime.now
      errors.add(:payment_date, :cannot_be_in_the_future)
    end
  end
end
