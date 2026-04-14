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
end
