class AddDefaultValueToApproved < ActiveRecord::Migration
  def up
	  change_column :appointments, :approved, :boolean, :default => false

  end

  def down
   	  change_column :appointments, :admin, :boolean, :default => nil
  
  end
end
