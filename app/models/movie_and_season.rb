class MovieAndSeason
  def self.all
    Movie.order_union_scope(scopes: [Season], order_field: :created_at)
  end
end
