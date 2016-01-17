# Public: Endpoint to return the seasons ordered by creation,
# including a list of episodes ordered by number (check SeasonSerializer).
class SeasonsController < ApplicationController
  def index
    seasons = Rails.cache.fetch 'seasons', expires_in: 7.days do
      Season.order(:created_at)
    end
    respond_to do |format|
      format.json { render json: seasons }
    end
  end
end
