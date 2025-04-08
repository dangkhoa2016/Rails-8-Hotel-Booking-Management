module RoomTypesHelper
  def render_room_type_form_field_color(form, record)
    render_text_form_field(form, record, "color", type: "color")
  end

  def render_room_type_color(record)
    value = record.send(:color)
    content_tag(:span, "", data: { border_color: value },
      style: "background-color: #{value}; width: 20px; height: 20px; display: inline-block;")
  end

  def room_type_html_data_attributes(record)
    {
      controller: "border-color",
      border_color_element_selector_value: ".card"
    }
  end
end
