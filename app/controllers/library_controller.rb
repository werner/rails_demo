# Public: Endpoint to get the library of a user ordered
# by time.
class LibraryController < ApplicationController
  def index
    library = Rails.cache.fetch 'library', expires_in: 7.days do
      current_user.library
    end
    respond_to do |format|
      format.json { render json: library }
    end
  end
end
