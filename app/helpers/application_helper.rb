module ApplicationHelper
  include Pagy::Frontend

  def nav_list
    [
      {
        model: :customers,
        icon: "person"
      },
      {
        model: :vip_customers_benefits,
        icon: "person-badge"
      },
      {
        model: nil # hr
      },
      {
        model: :bookings,
        icon: "currency-dollar"
      },
      {
        model: :payments,
        icon: "credit-card"
      },
      {
        model: :reservations,
        icon: "calendar-check"
      },
      {
        model: :special_requests,
        icon: "pencil-square"
      },
      {
        model: :booking_discounts,
        icon: "percent"
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
      {
        model: nil # hr
      },
      {
        model: :reviews,
        icon: "star"
      },
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
      }
    ]
  end

  def is_current_page?(model)
    controller_name == model.to_s.pluralize && action_name != "index"
  end

  def page_title
    default_title = "Hotel Booking Management"
    arr = [ default_title ]
    arr << content_for(:title) if content_for?(:title)
    arr.join(" | ")
  end

  def sidebar_name(key)
    I18n.t("activerecord.models.#{key.to_s.singularize}").pluralize(I18n.locale)
  end

  def translated_model_name(record)
    record.class.model_name.human
  end

  def is_index_action?
    action_name == "index"
  end
end
