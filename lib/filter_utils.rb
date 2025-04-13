module FilterUtils
  QUERYSTRING_FILTER_KEY = "q"

  def get_filters
    @get_filters ||= begin
      filter_hash = {}
      filter_queries.each do |key, value|
        if value.present? && is_column_filterable?(key)
          filter_key = key.to_s.sub(/^from_/, "").sub(/^to_/, "")
          if key.to_s.start_with?("from_") || key.to_s.start_with?("to_")
            if !filter_hash[filter_key]
              filter_hash[filter_key] = { from: nil, to: nil }
            end

            if key.to_s.start_with?("from_")
              filter_hash[filter_key][:from] = value
            elsif key.to_s.start_with?("to_")
              filter_hash[filter_key][:to] = value
            end
          else
            filter_hash[key] = value
          end
        end
      end

      transform_filters(filter_hash)
    end
  end

  def transform_filters(filter_hash)
    transformed_filters = {}

    filter_hash.each do |key, value|
      if value.is_a?(Hash)
        if value[:from].present? && value[:to].present?
          if is_date_column?(key)
            transformed_filters[key] = value[:from].to_time.beginning_of_day..value[:to].to_time.end_of_day
          elsif is_integer_column?(key)
            transformed_filters[key] = value[:from].to_i..value[:to].to_i
          else
            transformed_filters[key] = value[:from].to_f..value[:to].to_f
          end
        elsif value[:from].present?
          if is_date_column?(key)
            transformed_filters[key] = [ "#{key} >= ?", value[:from].to_time.beginning_of_day ]
          elsif is_integer_column?(key)
            transformed_filters[key] = [ "#{key} >= ?", value[:from].to_i ]
          else
            transformed_filters[key] = [ "#{key} >= ?", value[:from].to_f ]
          end
        elsif value[:to].present?
          if is_date_column?(key)
            transformed_filters[key] = [ "#{key} <= ?", value[:to].to_time.end_of_day ]
          elsif is_integer_column?(key)
            transformed_filters[key] = [ "#{key} <= ?", value[:to].to_i ]
          else
            transformed_filters[key] = [ "#{key} <= ?", value[:to].to_f ]
          end
        end
      else
        transformed_filters[key] = value
      end
    end

    transformed_filters
  end

  def has_filters?
    get_filters.any?
  end

  def filter_queries
    request.query_parameters[QUERYSTRING_FILTER_KEY] || {}
  end

  def is_column_filterable?(column_name)
    filterable_columns.include?(column_name.to_s) ||
      filterable_columns.include?(column_name.to_s.sub(/^from_/, "")) ||
      filterable_columns.include?(column_name.to_s.sub(/^to_/, ""))
  end

  def filterable_columns
    @filterable_columns ||= begin
      get_index_page_columns(model_class).map do |column|
        column.is_a?(Hash) ? column[:name] : column
      end.uniq.map(&:to_s)
    end
  end

  def is_date_column?(column_name)
    type = model_class.columns_hash[column_name]&.type
    type == :date || type == :datetime || type == :time
  end

  def is_integer_column?(column_name)
    type = model_class.columns_hash[column_name]&.type
    type == :integer
  end

  def get_where_filters(filters)
    filters.each_with_object({}) do |(key, value), where_filters|
      column = key.to_s
      type = model_class.columns_hash[column]&.type

      case type
      when :string, :text
        where_filters[column] = [ "#{column} LIKE ?", "%#{value}%" ]
      when :integer, :float, :decimal, :date, :datetime, :time
        where_filters[column] = value
      when :boolean
        where_filters[column] = (value == "active")
      else
        if is_enum_column?(model_class, column) || is_associated_column?(model_class, column)
          where_filters[column] = value
        end
      end
    end
  end
end
