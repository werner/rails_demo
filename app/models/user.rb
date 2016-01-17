# Internal: User model
class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :purchases

  def library
    purchases.alive.order(:created_at)
  end
end
