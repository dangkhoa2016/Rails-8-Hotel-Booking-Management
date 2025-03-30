module PromotionsHelper
  def render_promotion_start_date(record)
    record.start_date&.to_date&.to_formatted_s(:long)
  end

  def render_promotion_end_date(record)
    record.end_date&.to_date&.to_formatted_s(:long)
  end
end
