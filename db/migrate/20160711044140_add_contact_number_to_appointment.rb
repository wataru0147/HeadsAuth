class AddContactNumberToAppointment < ActiveRecord::Migration
  def change
    add_column :appointments, :contact_number, :string
  end
end
