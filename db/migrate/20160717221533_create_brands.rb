class CreateBrands < ActiveRecord::Migration
  def change
    create_table :brands do |t|
      t.string :name
      t.text :description
      t.boolean :published

      t.timestamps null: false
    end
  end
end
