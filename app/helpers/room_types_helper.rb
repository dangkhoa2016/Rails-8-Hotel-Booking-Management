module RoomTypesHelper
  def render_room_type_form_field_color(form, record)
    render_text_form_field(form, record, "color", type: "color")
  end

  def render_room_type_color(record)
    content_tag(:span, "", style: "background-color: #{record.send(:color)}; width: 20px; height: 20px; display: inline-block;")
  end
end
