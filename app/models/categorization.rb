class Categorization < ActiveRecord::Base
  belongs_to :appointment
  belongs_to :category
end
