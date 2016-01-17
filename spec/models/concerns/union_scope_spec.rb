require 'rails_helper'

RSpec.describe UnionScope, type: :controller do
  describe 'Union search' do
    it 'makes the union query between movies and seasons' do
      [:three_hundred, :interstellar, :inception,
       :dragon_ball, :seinfeld, :lost].each do |content|
        FactoryGirl.create(content)
      end

      movies = Movie.execute_union([Season]).map { |m| m['title'] }
      expect(movies).to(
        eq(['300: Rise of an Empire', 'Dragon Ball',
            'Interstellar', 'Seinfeld', 'Inception', 'Lost'])
      )

      expect(Movie.send(:base_union, [Season])).to(
        eq('SELECT "seasons".* FROM "seasons" UNION SELECT "movies".* FROM ' \
           '"movies"')
      )
    end

    it 'makes the union query with an order clause' do
      [:three_hundred, :interstellar, :inception,
       :dragon_ball, :seinfeld, :lost].each do |content|
        FactoryGirl.create(content)
      end

      movies = Movie.execute_union_with_order(scopes: [Season],
                                              order_field: :title).map do |m|
        m['title']
      end
      expect(movies).to(
        eq(['300: Rise of an Empire', 'Dragon Ball', 'Inception',
            'Interstellar', 'Lost', 'Seinfeld'])
      )

      expect(Movie.send(:union_with_order,
                        scopes: [Season],
                        order_field: :title)).to(
                          eq('SELECT "seasons".* FROM "seasons" ' \
                             'UNION SELECT "movies".* ' \
                             'FROM "movies" ORDER BY title')
                        )
    end
  end
end
