module ReservationsHelper
  def render_reservation_form_field_status(form, record)
    render_select_form_field(form, record, "status")
  end

  def reservation_booking_id_collection
    Booking.includes(:customer).map { |r| [ r.to_s, r.id ] }
  end
end
