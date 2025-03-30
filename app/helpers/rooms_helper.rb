module RoomsHelper
  def render_room_available(record)
    value = record.send(:available)
    return value if value.nil?
    Room.human_attribute_name("available.#{value ? "active" : "inactive"}")
  end
end
