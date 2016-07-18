class Brand < ActiveRecord::Base
	has_many :products

	scope :published, -> { where(published: true) }
	validates :name, presence: true, uniqueness: true
end
