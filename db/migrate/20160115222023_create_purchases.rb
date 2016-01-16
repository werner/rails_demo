class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.references :purchase_option
      t.references :user
      t.references :purchasable, polymorphic: true, index: true

      t.timestamps null: false
    end

    add_index :purchases, :purchasable_id
  end
end
