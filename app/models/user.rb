class User < ActiveRecord::Base
 

  #before_save { self.email = email.downcase! }
  before_save :password_digest
  has_many :appointments, :dependent => :destroy
  
  attr_accessor :password
  

  has_secure_password(validations: false)



  validates_presence_of :password, :on => :create, unless: :guest?
  validates_confirmation_of :password
  validates_presence_of :email, unless: :guest? 
  validates_uniqueness_of :email, allow_blank: true
  
  validates :first_name, presence: true  , length: {minimum: 2}, unless: :guest? 
  #validates the presence of first_name and last_name and will not validate if the user is a guest
  validates :last_name, presence: true  , length: {minimum: 2}, unless: :guest? 
  validates :contact_number,  presence: true, format: { with: /09[0-9]{2}-[0-9]{3}-[0-9]{4}/,  message: "Follow (09xx-xxx-xxxx)" } , unless: :guest?

#for guests
  def email_loggedin
    guest ? "Guest" : email
  end
  #method for guest_user

  def self.new_guest
    new{ |u| u.guest = true }
  end



#for authentication
  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end
  
  def password_digest
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end


  def move_to(user)
    appointments.update_all(user_id: user.id)
  end


end