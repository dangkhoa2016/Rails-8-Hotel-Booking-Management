module RoomTypesHelper
  def render_room_type_form_field_color(form, record)
    render_text_form_field(form, record, "color", type: "color")
  end
end
