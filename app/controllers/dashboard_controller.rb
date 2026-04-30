class DashboardController < ApplicationController
  def index
    connection = ActiveRecord::Base.connection
    excluded_tables = %w[schema_migrations ar_internal_metadata]

    @table_stats = connection.tables
      .reject { |table_name| excluded_tables.include?(table_name) }
      .sort
      .map do |table_name|
        count = connection.select_value("SELECT COUNT(*) FROM #{connection.quote_table_name(table_name)}").to_i
        { name: table_name, row_count: count }
      end

    @total_rows = @table_stats.sum { |table_stat| table_stat[:row_count] }
  end
end
