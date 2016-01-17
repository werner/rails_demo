# Internal: Episode model
class Episode < ActiveRecord::Base
  belongs_to :season
end
