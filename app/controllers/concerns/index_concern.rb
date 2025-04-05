module IndexConcern
  include ActiveSupport::Concern
  include Utils

  def index
    @pagy, @records = pagy(model_query)
  end

  private

  def order_by
    if respond_to?(:order_columns)
      order_columns
    else
      { created_at: :desc }
    end
  end

  def get_include_models
    if respond_to?(:include_models, true)
      return include_models
    end

    get_index_page_columns(model_class).select do |column|
      column[:name].to_s.end_with?("_id")
    end.map do |column|
      column[:name].to_s.sub(/_id$/, "")
    end
  end

  def model_query
    model_class.includes(get_include_models).order(order_by)
  end
end
