class Movie < ActiveRecord::Base
  include UnionScope

  has_many :purchase_options, as: :choosable

  validates :title, uniqueness: true
end
