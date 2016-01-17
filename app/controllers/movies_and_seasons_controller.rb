# Public: Endpoint to return movies and seasons ordered by creation.
class MoviesAndSeasonsController < ApplicationController
  def index
    movies_and_seasons = Rails.cache.fetch('movies_and_seasons',
                                           expires_in: 7.days) do
      MovieAndSeason.all
    end
    respond_to do |format|
      format.json { render json: movies_and_seasons }
    end
  end
end
