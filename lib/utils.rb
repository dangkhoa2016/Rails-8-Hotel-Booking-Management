module Utils
  def get_default_columns(model_class)
    model_class.columns.map(&:name) - %w[id created_at updated_at encrypted_password]
  end

  def get_columns(model_class)
    columns = []
    if is_index_action?
      columns = model_class.display_at_index_page_columns if model_class.respond_to?(:display_at_index_page_columns)
    end

    columns = get_default_columns(model_class) if columns.empty?

    columns
  end

  def is_enum_column?(record, column)
    record.class.defined_enums.keys.include?(column)
  end

  def translated_model_name(record)
    record.class.model_name.human
  end

  def is_associated_column?(record, column)
    record.class.reflect_on_all_associations(:belongs_to).map(&:name).include?(column.to_sym) ||
      record.class.reflect_on_all_associations(:has_one).map(&:name).include?(column.to_sym)
  end

  def is_index_action?
    action_name == "index"
  end

  def model_class
    controller_name.classify.constantize
  end
end
