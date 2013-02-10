class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :password,:password_confirmation, :username, :account_type_id

  has_secure_password

  has_many :surveys
  belongs_to :account_type


  validates :first_name, :presence => true
  validates :last_name, :presence => true

  validates :password, :presence => true, :on => :create
  validates_size_of :password, :within => 6..15, :on => :create
  before_create { generate_token(:auth_token) }

  validates :email, :presence => true, :uniqueness => true
  validates :email, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }
  #validates_format_of :email, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i
  #validates_uniqueness_of :email

  validates :username, :presence => true, :uniqueness => true
#  validates :username, :presence => true
#  validates_uniqueness_of :username



  def full_name
    "#{self.first_name }"+" "+ "#{self.last_name}".camelize
  end

  def full_name_by_id(us)
    "#{self.first_name }"+" "+ "#{self.last_name}".camelize
  end

  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    UserMailer.password_reset(self).deliver
  end


  def generate_token(column)
    begin
      
      #self[column] = SecureRandom.hex
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end

end
