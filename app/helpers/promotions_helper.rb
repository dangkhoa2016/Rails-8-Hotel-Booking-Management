module PromotionsHelper
  def render_promotion_start_date(record)
    value = record.start_date&.to_date
    return value if value.nil?
    I18n.localize value, format: :long
  end

  def render_promotion_end_date(record)
    value = record.end_date&.to_date
    return value if value.nil?
    I18n.localize value, format: :long
  end
end
