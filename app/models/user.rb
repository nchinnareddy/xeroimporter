class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:login]

  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body

  before_validation :before_validation_on_create
  
  # Virtual attribute for authenticating by either username or email
  # This is in addition to a real persisted field like 'username'
  attr_accessor :login
  attr_accessible :login

  validate :email, :email => true, :uniqueness => true
  validate :login, :presence => true, :if => :new_record? 
  validate :username, :uniqueness => true
  validates_format_of :username, :with => /[\w \.\-@]+/

  validates_length_of :password, :within => 6..255
  validates_format_of :password, :with => /[\w \.\-@]+/

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions).first
    end
  end
  
  
  protected

  def before_validation_on_create
    if self.new_record? 
      if self.login && self.login.include?("@") 
        self.email = self.login
      else
        self.username = self.login
      end
    end
  end 
    
end
