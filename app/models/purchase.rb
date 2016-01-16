class Purchase < ActiveRecord::Base
  belongs_to :purchasable, polymorphic: true
  belongs_to :user

  ACTIVE_DAYS = 2.days

  before_create do
    if product = Purchase.where(purchasable: self.purchasable).first and product.active?
      errors.add(:base, "You are still available to watch #{self.purchasable.title}")
      false 
    end
  end

  def active?
    (created_at + ACTIVE_DAYS) > Time.now
  end
end
