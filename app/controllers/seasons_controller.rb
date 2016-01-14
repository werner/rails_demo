class SeasonsController < ApplicationController
  def index
    respond_to do |format|
      format.json { render json: Season.order(:created_at) }
    end
  end
end
