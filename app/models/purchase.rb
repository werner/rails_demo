class Purchase < ActiveRecord::Base
  belongs_to :purchasable, polymorphic: true
  belongs_to :user

  ACTIVE_DAYS = 2.days

  before_create do
    if product = Purchase.where(purchasable: self.purchasable).first and product.active?
      errors.add(:base, I18n.t('activerecord.errors.models.purchase.active_product', title: self.purchasable.title))
      false 
    end
  end

  def active?
    (created_at + ACTIVE_DAYS) > Time.now
  end
end
