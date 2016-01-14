class Season < ActiveRecord::Base
  has_many :episodes
  has_and_belongs_to_many :purchase_options
end
