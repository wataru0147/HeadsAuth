class RenameHoursMinutesColumns < ActiveRecord::Migration
  def self.up
  	rename_column :appointments, :hours, :hour
  	rename_column :appointments, :minutes, :minute
  end
end
