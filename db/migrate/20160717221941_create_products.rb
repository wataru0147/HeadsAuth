class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price
      t.text :description
      t.references :brand, index: true, foreign_key: true
      t.boolean :published

      t.timestamps null: false
    end
  end
end
