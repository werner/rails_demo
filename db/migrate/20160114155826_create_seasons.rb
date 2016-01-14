class CreateSeasons < ActiveRecord::Migration
  def change
    create_table :seasons do |t|
      t.string :title
      t.text :plot

      t.timestamps null: false
    end
  end
end
