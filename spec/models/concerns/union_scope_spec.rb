require 'rails_helper'

RSpec.describe UnionScope, type: :controller do
  describe 'Union search' do
    it 'makes the union query between movies and seasons' do
      expect(Movie.base_union([Season])).to(
        eq('SELECT "seasons".* FROM "seasons" UNION SELECT "movies".* FROM "movies"')
      )
    end

    it 'makes the union query with an order clause' do
      expect(Movie.union_with_order(scopes: [Season], order_field: :title)).to(
        eq('SELECT "seasons".* FROM "seasons" UNION SELECT "movies".* FROM "movies" ORDER BY title')
      )
    end
  end
end
