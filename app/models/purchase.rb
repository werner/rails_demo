# Internal: Purchase model, this contains a scope to return alive records,
# based on creation of purchase and a validation that forbides to purchase
# the same content while it is alive or active.
class Purchase < ActiveRecord::Base
  belongs_to :purchasable, polymorphic: true
  belongs_to :purchase_option
  belongs_to :user

  validates :purchasable, presence: true

  scope :alive, -> { where("created_at >= '#{Time.now - ACTIVE_DAYS}'") }

  ACTIVE_DAYS = 2.days

  before_create do
    product = Purchase.where(purchasable: purchasable).first
    if product && product.active?
      errors.add(:base,
                 I18n.t('activerecord.errors.models.purchase.active_product',
                        title: purchasable.title))
      false
    end
  end

  def active?
    (created_at + ACTIVE_DAYS) >= Time.now
  end
end
