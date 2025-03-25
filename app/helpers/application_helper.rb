module ApplicationHelper
  def nav_list
    [
      {
        model: :customers,
        icon: "person"
      },
      {
        model: :vip_customer_benefits,
        icon: "person-badge"
      },
      {
        model: nil # hr
      },
      {
        model: :bookings,
        icon: "calendar-check"
      },
      {
        model: :payments,
        icon: "credit-card"
      },
      {
        model: :room_reservations,
        icon: "calendar-check",
      },
      {
        model: nil # hr
      },
      {
        model: :rooms,
        icon: "house-door"
      },
      {
        model: :room_types,
        icon: "door-open"
      },
      {
        model: :facilities,
        icon: "building"
      },
      {
        model: :hotel_locations,
        icon: "geo-alt"
      },
      {
        model: nil # hr
      },
      {
        model: :promotions,
        icon: "tags"
      },
      # {
      #   model: :discounts,
      #   icon: "percent"
      # },
      {
        model: nil # hr
      },
      {
        model: :reviews,
        icon: "star"
      },
      # {
      #   model: :special_requests,
      #   icon: "pencil-square"
      # },
      {
        model: :additional_services,
        icon: "tools"
      },
      {
        model: nil # hr
      },
      {
        model: :users,
        icon: "person-badge"
      },
    ]
  end

  def is_current_page?(model)
    controller_name == model.to_s.pluralize && action_name != "index"
  end
end
