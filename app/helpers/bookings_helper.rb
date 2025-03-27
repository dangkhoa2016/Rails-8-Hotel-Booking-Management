module BookingsHelper
  def render_booking_form_field_status(form, record)
    render_select_form_field(form, record, "status")
  end

  def render_booking_form_field_discount_note(form, record)
    render_textarea_form_field(form, record, "discount_note", rows: 3)
  end
end
