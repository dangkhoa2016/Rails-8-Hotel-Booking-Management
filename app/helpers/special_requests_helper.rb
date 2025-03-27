module SpecialRequestsHelper
  def render_special_request_form_field_request(form, record)
    render_textarea_form_field(form, record, "request", rows: 3)
  end
end
