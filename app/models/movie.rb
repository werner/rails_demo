class Movie < ActiveRecord::Base
  include UnionScope

  has_and_belongs_to_many :purchase_options

  validates :title, uniqueness: true
end
