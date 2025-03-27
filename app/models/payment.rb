class Payment < ApplicationRecord
  belongs_to :booking


  enum :payment_method, { cash: "cash", credit_card: "credit_card", bank_transfer: "bank_transfer", online_wallet: "online_wallet", cryptocurrency: "cryptocurrency" }
  enum :payment_type, { one_time_payment: "one_time_payment", installment_payment: "installment_payment", subscription: "subscription" }


  def to_s
    "Payment of #{amount} on #{payment_date&.strftime('%Y-%m-%d')}"
  end
end
