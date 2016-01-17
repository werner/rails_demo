# Internal: Season model
class Season < ActiveRecord::Base
  has_many :episodes

  has_many :purchase_options, as: :choosable
  has_many :purchases, as: :purchasable

  validates :title, uniqueness: true
end
