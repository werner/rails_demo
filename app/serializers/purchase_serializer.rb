class PurchaseSerializer < ActiveModel::Serializer
  attributes :purchasable, :purchase_option, :user

  belongs_to :purchasable
end
