# Public: Endpoint to return all movies, ordered by creation.
class MoviesController < ApplicationController
  def index
    movies = Rails.cache.fetch 'movies', expires_in: 7.days do
      Movie.order(:created_at)
    end
    respond_to do |format|
      format.json { render json: movies }
    end
  end
end
