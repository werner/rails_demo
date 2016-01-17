require 'active_support/concern'

# Internal: Concern that performs an Union query and return an array of records.
module UnionScope
  extend ActiveSupport::Concern

  def self.included(base)
    base.send :extend, ClassMethods
  end

  # Internal: All methods are class methods
  module ClassMethods
    # Internal: Returns a simple UNION query.
    #
    # scopes  - An array of model classes.
    #
    # Example
    #
    #   Model.execute_union([AnotherModel])
    #
    # Returns an array with an UNION query clause.
    def execute_union(options = {})
      execute_sql(base_union(options))
    end

    # Internal: Returns an ordered UNION query.
    #
    # scopes  - named parameters with scopes and order_field defined.
    #
    # Example
    #
    #   Model.execute_union_with_order(scopes: [AnotherModel],
    #                                  order_field: :created_at)
    #
    # Returns an array with an UNION and ORDER BY query clause.
    def execute_union_with_order(options = {})
      execute_sql(union_with_order(options))
    end

    private

    def base_union(scopes)
      this_scopes = scopes.push(self)
      this_scopes.map { |s| s.all.to_sql }.join(' UNION ')
    end

    def union_with_order(options = {})
      scopes = options[:scopes]
      order_field = options[:order_field]
      base_union(scopes).concat(" ORDER BY #{order_field}")
    end

    def execute_sql(sql)
      ActiveRecord::Base.connection.execute(send(:sanitize_sql_array, sql))
    end
  end
end
