module FilterHelper
  def render_filters(form)
    filterable_columns.map do |field|
      content_tag(:div, class: "col") do
        content_tag(:div, class: "card p-2") do
          render_filter(form, field)
        end
      end
    end.join.html_safe
  end

  def render_label(form, field)
    label_text = model_class.human_attribute_name(field)
    form.label(field, label_text, class: "form-label")
  end

  def is_range_filter?(field)
    return false if field.to_s.end_with?("_id")

    type = model_class.columns_hash[field.to_s].type
    type.in?(%i[date datetime integer float decimal])
  end

  def render_filter(form, field)
    filter = guess_filter_type(form, field)
    if filter
      render_label(form, field) + filter
    else
      render_filter_by_type(form, field)
    end
  end

  def render_filter_by_type(form, field)
    type = model_class.columns_hash[field.to_s].type
    value = filter_queries[field]

    case type
    when :date, :time, :datetime
      render_filter_date_field(form, field)
    when :boolean
      render_label(form, field) + render_filter_boolean_field(form, field, value)
    when :enum
      render_label(form, field) + render_filter_enum_field(form, field, value)
    when :integer
      render_filter_number_field(form, field)
    when :float, :decimal
      render_filter_number_field(form, field, step: "0.01")
    else
      render_label(form, field) + render_filter_text_field(form, field, value)
    end
  end

  def guess_filter_type(form, field)
    klass = model_class
    value = filter_queries[field]

    if is_enum_column?(klass, field)
      render_filter_enum_field(form, field, value)
    elsif is_associated_column?(klass, field.gsub(/_id$/, ""))
      custom_collection_from_helper = "#{klass.model_name.element}_#{field}_collection"
      collection = if respond_to?(custom_collection_from_helper)
        send(custom_collection_from_helper)
      else
        get_associated_collection(klass, field)
      end
      render_filter_association_field(form, field, value, collection)
    end
  end

  def render_filter_date_field(form, field)
    from_value = filter_queries["from_#{field}"]
    to_value = filter_queries["to_#{field}"]
    render "shared/filters/date_range", form: form, name: field, from_value: from_value, to_value: to_value, label_name: model_class.human_attribute_name(field)
  end

  def render_filter_number_field(form, field, step: nil)
    from_value = filter_queries["from_#{field}"]
    to_value = filter_queries["to_#{field}"]
    render "shared/filters/number_range", form: form, name: field, from_value: from_value, to_value: to_value, label_name: model_class.human_attribute_name(field), step: step
  end

  def render_filter_boolean_field(form, field, value)
    render_check_box_form_field(form, model_class, field, value || "active")
  end

  def render_filter_enum_field(form, field, value)
    enum = model_class.defined_enums[field.to_s]
    collection = enum.keys.map { |key| [ model_class.human_attribute_name("#{field}.#{key}"), key ] }
    render_filter_collection_field(form, field, value, collection)
  end

  def render_filter_textarea_field(form, field, value)
    form.text_area(field, value: value, class: "form-control", rows: 5)
  end

  def render_filter_text_field(form, field, value, options = {})
    form.text_field(field, value: value, class: "form-control", **options)
  end

  def render_filter_association_field(form, field, value, collection)
    render_filter_collection_field(form, field, value, collection)
  end

  def render_filter_collection_field(form, field, value, collection)
    form.select(field, collection, { selected: value, include_blank: true }, class: "form-select")
  end
end
