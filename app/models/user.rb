class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:login]
  before_validation :generate_confirmation_token, :if => :confirmation_required?

  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :email, :password, :password_confirmation, :remember_me, :is_admin
  # attr_accessible :title, :body

  # before_validation :before_validation_on_create

  # Virtual attribute for authenticating by either username or email
  # This is in addition to a real persisted field like 'username'

  validate :email, :presence => true, :email => true, :uniqueness => true

  validates_length_of :password, :within => 6..255
  validates_format_of :password, :with => /[\w \.\-@]+/
  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      user = where(conditions).where(["lower(email) = :value", { :value => login.downcase }]).first
   # else
    #  user = where(conditions).where(:comfirmable => true).first
    end
    return user if user && user.confirmed?
  end
 def admin?
    is_admin
  end
end
