module RenderRecordShowHelper
  def render_record_fields(record)
    columns = is_index_action? ? get_index_page_columns(record.class) : get_show_page_and_form_columns(record.class)

    columns.map do |column|
      column_name = column[:name].to_s
      content_tag(:div, class: column[:css_class]) do
        content_tag(:p) do
          translated_column_name = record.class.human_attribute_name(column_name)
          content_tag(:strong, translated_column_name) + ": " + render_field_value(record, column_name)
        end
      end
    end.join.html_safe
  end

  def render_date_field(record, column)
    value = record.send(column)
    return value if value.nil?
    I18n.localize value, format: :long
  end

  def render_datetime_field(record, column)
    value = record.send(column)
    return value if value.nil?
    I18n.localize value, format: :long
  end

  def render_boolean_field(record, column)
    value = record.send(column)
    return value if value.nil?
    I18n.translate("base.#{value}")
  end

  def render_enum_field(record, column)
    value = record.send(column)
    return value if value.nil?
    record.class.human_attribute_name("#{column}.#{value}")
  end

  def guess_field_and_render(record, column)
    if is_enum_column?(record, column)
      render_enum_field(record, column)
    elsif is_associated_column?(record, column.sub(/_id$/, ""))
      associated_record = record.send(column.sub(/_id$/, ""))
      if associated_record
        link_to(associated_record.to_s.html_safe, polymorphic_path(associated_record))
      else
        record.send(column).to_s.presence || I18n.t("base.blank")
      end
    end
  end

  def render_field_value(record, column)
    custom_render_from_helper = "render_#{record.class.model_name.element}_#{column}"
    if respond_to?(custom_render_from_helper)
      return send(custom_render_from_helper, record)
    end

    guess_field_and_render(record, column) || render_field_by_type(record, column)
  end

  def render_text_field(record, column)
    record.send(column).to_s
  end

  def render_field_by_type(record, column)
    type = record.class.columns_hash[column].type
    case type
    when :date
      render_date_field(record, column)
    when :datetime
      render_datetime_field(record, column)
    when :boolean
      render_boolean_field(record, column)
    when :enum
      render_enum_field(record, column)
    when :float, :decimal
      (record.send(column)).display_as_money
    when :integer
      number_with_delimiter(record.send(column))
    else
      render_text_field(record, column)
    end
  end
end
