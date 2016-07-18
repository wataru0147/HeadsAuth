class Category < ActiveRecord::Base
	has_many :categorizations
	has_many :appointments, through: :categorizations
	#has_and_belongs_to_many :appointments, :join_table => "appointments_categs"
end
