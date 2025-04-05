module RenderRecordFormHelper
  def render_record_form(form, record)
    columns = get_form_columns(record)
    columns.map do |column|
      column_name = column[:name].to_s
      content_tag(:div, class: column[:css_class]) do
        content_tag(:div, class: "form-group mb-3") do
          form.label(column_name, class: "form-label") + render_form_field(form, record, column_name)
        end
      end
    end.join.html_safe
  end

  def get_form_columns(record)
    columns = get_show_page_and_form_columns(record.class)
    if record.class.name == "User"
      columns << { name: :password, css_class: "col-12" }
    end
    columns
  end

  def guess_form_field_type(form, record, column)
    if column == "status"
      render_boolean_form_field(form, record, column)
    elsif is_enum_column?(record, column)
      render_enum_form_field(form, record, column)
    elsif column.in?([ "summary", "note", "description" ])
      render_textarea_form_field(form, record, column, rows: 3)
    elsif column == "password"
      render_text_form_field(form, record, column, type: "password")
    elsif column == "email"
      render_text_form_field(form, record, column, type: "email")
    elsif is_associated_column?(record, column.sub(/_id$/, ""))
      custom_collection_from_helper = "#{record.class.model_name.element}_#{column}_collection"
      collection = if respond_to?(custom_collection_from_helper)
        send(custom_collection_from_helper)
      else
        get_associated_collection(record.class, column)
      end
      form.select(column, collection, { include_blank: true }, class: "form-select")
    end
  end

  def get_associated_collection(model_class, column)
    model_class.reflect_on_association(column.sub(/_id$/, "")).klass.all.map { |r| [ r.to_s, r.id ] }
  end

  def render_form_field(form, record, column)
    custom_render_from_helper = "render_#{record.class.model_name.element}_form_field_#{column}"
    if respond_to?(custom_render_from_helper)
      return send(custom_render_from_helper, form, record)
    end

    guess_form_field_type(form, record, column) || render_form_field_by_type(form, record, column)
  end

  def render_form_field_by_type(form, record, column)
    type = record.class.columns_hash[column].type

    case type
    when :date
      render_date_form_field(form, record, column)
    when :datetime
      render_datetime_form_field(form, record, column)
    when :boolean
      render_boolean_form_field(form, record, column)
    when :enum
      render_enum_form_field(form, record, column)
    when :text
      render_textarea_form_field(form, record, column, rows: 5)
    when :integer
      render_text_form_field(form, record, column, type: "number")
    when :float, :decimal
      render_text_form_field(form, record, column, type: "number", step: "0.01")
    else
      render_text_form_field(form, record, column)
    end
  end

  def render_date_form_field(form, record, column)
    render_text_form_field(form, record, column, type: "date")
  end

  def render_datetime_form_field(form, record, column)
    form.datetime_field(column, class: "form-control")
  end

  def render_boolean_form_field(form, record, column)
    render_check_box_form_field(form, record, column)
  end

  def render_enum_form_field(form, record, column)
    render_select_form_field(form, record, column)
  end

  def render_text_form_field(form, record, column, options = {})
    form.text_field(column, class: "form-control", **options)
  end

  def render_textarea_form_field(form, record, column, options = {})
    form.text_area(column, class: "form-control", **options)
  end

  def render_check_box_form_field(form, record, column)
    true_text = record.class.human_attribute_name("#{column}.active")
    false_text = record.class.human_attribute_name("#{column}.inactive")
    data = { controller: "form-switch", true_text: true_text, false_text: false_text }
    content_tag(:div, class: "form-check form-switch", data: data) do
      value = record.send(column)
      form.check_box(column, { class: "form-check-input", role: "switch" }, "active", "inactive") +
        form.label(column, value == "active" ? true_text : false_text, class: "form-check-label", role: "button")
    end
  end

  def render_select_form_field(form, record, column)
    enum = record.class.defined_enums[column.to_s]
    collection = enum.keys.map { |key| [ record.class.human_attribute_name("#{column}.#{key}"), key ] }
    form.select(column, collection, { include_blank: true }, class: "form-select")
  end

  def get_form_url(record)
    custom_form_url = "#{record.class.model_name.element}_form_url"
    if respond_to?(custom_form_url)
      send(custom_form_url, record)
    end
  end
end
