class MoviesAndSeasonsController < ApplicationController
  def index
    respond_to do |format|
      format.json { render json: MovieAndSeason.all }
    end
  end
end
