module BookingsHelper
  def booking_status_color(status)
    case status.to_sym
    when :confirmed, :checked_in
      "success"
    when :pending, :waiting_for_payment
      "warning"
    when :canceled, :refunded, :no_show
      "danger"
    when :checked_out
      "info"
    else
      "secondary"
    end
  end

  def render_booking_form_field_status(form, record)
    render_select_form_field(form, record, "status")
  end

  def render_booking_form_field_discount_note(form, record)
    render_textarea_form_field(form, record, "discount_note", rows: 3)
  end
end
