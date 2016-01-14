class Movie < ActiveRecord::Base
  has_and_belongs_to_many :purchase_options
end
