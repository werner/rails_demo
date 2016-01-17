class LibraryController < ApplicationController
  def index
    respond_to do |format|
      format.json { render json: current_user.library }
    end
  end
end
