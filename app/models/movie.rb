# Internal: Movie model
class Movie < ActiveRecord::Base
  include UnionScope

  has_many :purchases, as: :purchasable
  has_many :purchase_options, as: :choosable

  validates :title, uniqueness: true
end
