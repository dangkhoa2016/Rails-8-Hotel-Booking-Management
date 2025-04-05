module SpecialRequestsHelper
  def render_special_request_form_field_request(form, record)
    render_textarea_form_field(form, record, "request", rows: 3)
  end

  def special_request_booking_id_collection
    Booking.includes(:customer).map { |r| [ r.to_s, r.id ] }
  end

  def special_request_reservation_id_collection
    Reservation.includes(:room).map { |r| [ r.to_s, r.id ] }
  end
end
