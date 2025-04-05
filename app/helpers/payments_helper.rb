module PaymentsHelper
  def payment_booking_id_collection
    Booking.includes(:customer).map { |r| [ r.to_s, r.id ] }
  end
end
