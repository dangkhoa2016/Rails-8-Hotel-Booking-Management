module BookingDiscountsHelper
  def render_booking_discount_discount_percent(record)
    record.discount_percent.display_as_percentage
  end

  def render_booking_discount_discount_amount(record)
    record.discount_amount.display_as_money
  end

  def booking_discount_promotion_id_collection
    Promotion.all.map do |r|
      discount_value = if r.discount_type == "percent"
        r.discount_percent.display_as_percentage
      else
        r.discount_amount.display_as_money
      end

      [ "#{r.name} (#{discount_value})", r.id ]
    end
  end
end
