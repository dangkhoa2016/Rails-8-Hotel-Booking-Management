module ReservationsHelper
  def render_reservation_form_field_status(form, record)
    render_select_form_field(form, record, "status")
  end
end
