require 'active_support/concern'

module UnionScope
  extend ActiveSupport::Concern

  def self.included(base)
    base.send :extend, ClassMethods
  end

  module ClassMethods
    def union_scope(scopes)
      execute_sql(base_union(scopes))
    end

    def order_union_scope(options={})
      scopes = options[:scopes]
      order_field = options[:order_field]
      execute_sql(base_union(scopes).concat(" ORDER BY #{order_field}"))
    end

    private

    def base_union(scopes)
      id_column = "#{table_name}.id"
      this_scopes = scopes.push(self)
      scopes.map { |s| s.all.to_sql }.join(" UNION ")
    end

    def execute_sql(*sql_array)     
      ActiveRecord::Base.connection.execute(send(:sanitize_sql_array, sql_array))
    end
  end
end
