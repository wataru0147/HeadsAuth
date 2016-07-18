class AddAdminAndStaffToUsers < ActiveRecord::Migration
  def change
    add_column :users, :admin, :boolean
    add_column :users, :staff, :boolean
  end
end
