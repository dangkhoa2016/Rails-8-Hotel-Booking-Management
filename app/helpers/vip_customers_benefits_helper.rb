module VipCustomersBenefitsHelper
  def render_vip_customers_benefit_discount_percent_on_room_price(record)
    record.discount_percent_on_room_price.display_as_percentage
  end

  def render_vip_customers_benefit_discount_percent_on_additional_services(record)
    record.discount_percent_on_additional_services.display_as_money
  end

  def render_vip_customers_benefit_discount_amount_on_room_price(record)
    record.discount_amount_on_room_price.display_as_money
  end

  def render_vip_customers_benefit_discount_amount_on_additional_services(record)
    record.discount_amount_on_additional_services.display_as_money
  end
end
