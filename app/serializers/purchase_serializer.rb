class PurchaseSerializer < ActiveModel::Serializer
  attributes :purchasable, :purchase_option, :user

  belongs_to :purchasable
  belongs_to :purchase_option
  belongs_to :user
end
