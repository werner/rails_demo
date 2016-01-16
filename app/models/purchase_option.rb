class PurchaseOption < ActiveRecord::Base
  belongs_to :choosable, polymorphic: true
end
