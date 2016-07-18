class Appointment < ActiveRecord::Base
	  #before_validation :save_contact_number


	belongs_to :user
	has_many :categorizations
	has_many :categories, through: :categorizations
	#has_and_belongs_to_many :categories, :join_table => "appointments_categs"

	validates :date, presence: true
	validates :hour, presence: true
 	validates :minute, presence: true
 	#validates :category_id, presence: true
	validates :contact_number,  presence: true, format: { with: /09[0-9]{2}-[0-9]{3}-[0-9]{4}/,  message: "Format should be (09xx-xxx-xxxx)" }
	#validates :contact_number, allow_blank: false
	# end

	#scopes
  	scope :unapprovedd, -> { where(approved: nil)} 
  	scope :unapproveddd, ->{ where(approved: false)}
  	scope :approvedd, -> { where(approved: true ) }
  	scope :valid, -> { where("date >= ?", Date.current ) }

	#def
 	# private
	
	# end

	def approved_app?
  		approved != nil && approved != false
	end
end
