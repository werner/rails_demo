class MovieAndSeason
  def self.all
    Movie.execute_union_with_order(scopes: [Season], order_field: :created_at)
  end
end
