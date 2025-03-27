module RenderRecordShowHelper
  def render_record_fields(record)
    columns = get_columns(record)
    columns.map do |column|
      column_name = column.respond_to?(:name) ? column.name : column
      content_tag(:p) do
        translated_column_name = record.class.human_attribute_name(column_name)
        content_tag(:strong, translated_column_name) + ': ' + render_field_value(record, column_name)
      end
    end.join.html_safe
  end

  def get_columns(record)
    columns = []
    if action_name == 'index'
      columns = record.display_at_index_page_columns if record.respond_to?(:display_at_index_page_columns)
    end

    if columns.empty?
      columns = record.class.columns.map(&:name) - %w[id created_at updated_at encrypted_password]
    end

    columns
  end

  def is_enum_column?(record, column)
    record.class.defined_enums.keys.include?(column)
  end

  def render_date_field(record, column)
    record.send(column)&.strftime('%Y-%m-%d')
  end

  def render_datetime_field(record, column)
    record.send(column)&.strftime('%Y-%m-%d %H:%M:%S')
  end

  def render_boolean_field(record, column)
    record.send(column) ? 'Yes' : 'No'
  end

  def render_enum_field(record, column)
    value = record.send(column)
    return value if value.nil?
    record.class.human_attribute_name("#{column}.#{value}")
  end

  def render_field_value(record, column)
    if is_enum_column?(record, column)
      return render_enum_field(record, column)
    end

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
    else
      record.send(column).to_s
    end
  end
end
