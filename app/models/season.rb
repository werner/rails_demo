class Season < ActiveRecord::Base
  has_many :episodes
  has_many :purchase_options, as: :choosable

  validates :title, uniqueness: true
end
