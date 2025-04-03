module BookingDiscountsHelper
  def render_booking_discount_discount_percent(record)
    record.discount_percent.display_as_percentage
  end

  def render_booking_discount_discount_amount(record)
    record.discount_amount.display_as_money
  end
end
