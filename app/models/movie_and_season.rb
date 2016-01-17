# Internal: MovieAndSeason model, this is a tableless model
# to group Movies and Seasons.
class MovieAndSeason
  # Internal: Creates an Union query between Movies and Seasons.
  #
  # Examples
  #
  #   MovieAndSeason.all
  #   # => [{"id"=>2, "title"=>"Superman",
  #          "plot"=>"Stronger man in the Universe",
  #          "created_at"=>"2016-01-16 15:35:36.154497",
  #          "updated_at"=>"2016-01-17 14:21:33.376065"},
  #         {"id"=>1, "title"=>"Rurouni Kenshin",
  #          "plot"=>"Samurai legend",
  #          "created_at"=>"2016-01-17 17:09:25.888162",
  #          "updated_at"=>"2016-01-17 17:09:25.888162"}]
  def self.all
    Movie.execute_union_with_order(scopes: [Season], order_field: :created_at)
  end
end
