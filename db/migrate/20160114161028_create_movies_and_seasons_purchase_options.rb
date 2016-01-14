class CreateMoviesAndSeasonsPurchaseOptions < ActiveRecord::Migration
  def change
    create_table :movies_purchase_options, id: false do |t|
      t.belongs_to :movie, index: true
      t.belongs_to :purchase_option, index: true
      t.timestamps null: false
    end

    create_table :seasons_purchase_options, id: false do |t|
      t.belongs_to :season, index: true
      t.belongs_to :purchase_option, index: true
      t.timestamps null: false
    end
  end
end
