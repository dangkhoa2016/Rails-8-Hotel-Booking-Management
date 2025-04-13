module Utils
  include FilterUtils

  def get_default_columns(model_class)
    model_class.columns.map(&:name) - %w[id created_at updated_at]
  end

  def get_index_page_columns(model_class)
    columns = []
    if model_class.respond_to?(:display_at_index_page_columns)
      columns = model_class.display_at_index_page_columns
    end

    columns = get_default_columns(model_class) if columns.empty?
    columns.map { |column| ensure_column_config(column) }
  end

  def get_show_page_and_form_columns(model_class)
    columns = []
    if model_class.respond_to?(:display_at_show_page_and_form_columns)
      columns = model_class.display_at_show_page_and_form_columns
    end

    columns = get_default_columns(model_class) if columns.empty?
    columns.map { |column| ensure_column_config(column) }
  end

  def ensure_column_config(column)
    column_config = column.is_a?(Hash) ? column : { name: column }
    column_config[:css_class] ||= "col-12"
    column_config
  end

  def is_enum_column?(record, column)
    return false unless record || column

    if record.is_a?(Class)
      record.defined_enums.keys.include?(column)
    else
      record.class.defined_enums.keys.include?(column)
    end
  end

  def translated_model_name(record)
    record.class.model_name.human
  end

  def is_associated_column?(record, column)
    return false unless record || column

    if record.is_a?(Class)
      record.reflect_on_all_associations(:belongs_to).map(&:name).include?(column.to_sym) ||
        record.reflect_on_all_associations(:has_one).map(&:name).include?(column.to_sym)
    else
      record.class.reflect_on_all_associations(:belongs_to).map(&:name).include?(column.to_sym) ||
        record.class.reflect_on_all_associations(:has_one).map(&:name).include?(column.to_sym)
    end
  end

  def is_index_action?
    action_name == "index"
  end

  def model_class
    controller_name.classify.constantize
  end
end
