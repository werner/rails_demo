require 'active_support/concern'

module UnionScope
  extend ActiveSupport::Concern

  def self.included(base)
    base.send :extend, ClassMethods
  end

  module ClassMethods

    def base_union(scopes)
      id_column = "#{table_name}.id"
      this_scopes = scopes.push(self)
      scopes.map { |s| s.all.to_sql }.join(" UNION ")
    end

    def union_with_order(options={})
      scopes = options[:scopes]
      order_field = options[:order_field]
      base_union(scopes).concat(" ORDER BY #{order_field}")
    end

    def execute_union_with_order(options={})
      execute_sql(union_with_order(options))
    end

    private

    def execute_sql(sql)
      ActiveRecord::Base.connection.execute(send(:sanitize_sql_array, sql))
    end
  end
end
