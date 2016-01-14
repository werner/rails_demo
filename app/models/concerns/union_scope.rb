require 'active_support/concern'

module UnionScope
  extend ActiveSupport::Concern

  def self.included(base)
    base.send :extend, ClassMethods
  end

  #TODO
  #Sanitize user inputs to avoid sql inyections
  module ClassMethods
    def union_scope(scopes)
      ActiveRecord::Base.connection.execute(base_union(scopes))
    end

    def order_union_scope(options={})
      scopes = options[:scopes]
      order_field = options[:order_field]
      ActiveRecord::Base.connection.execute(base_union(scopes).concat(" ORDER BY #{order_field}"))
    end

    private

    def base_union(scopes)
      id_column = "#{table_name}.id"
      this_scopes = scopes.push(self)
      scopes.map { |s| s.all.to_sql }.join(" UNION ")
    end
  end
end
