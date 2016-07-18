class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.date :date
      t.string :hours
      t.string :minutes
      t.boolean :approved
      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
