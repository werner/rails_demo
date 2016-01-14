class MoviesController < ApplicationController
  def index
    respond_to do |format|
      format.json { render json: Movie.order(:created_at) }
    end
  end
end
