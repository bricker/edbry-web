class User < ActiveRecord::Base
  has_secure_password # This is built into Rails 3.1. It gives us the "authenticate" method and the "password=" method. Also validates password confirmation. Uses BCrypt.
  
  ####### Associations
  # empty
  
  
  ####### Validations
  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true, format: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  
  
  ####### Password Reset
  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_requested_at = Time.zone.now
    save!
    UserMailer.password_reset(self).deliver
  end
  
  def generate_token(column) # This is separate so we can also use it for a "remember me" login functionality in the future
    begin
      self[column] = SecureRandom.urlsafe_base64 # ActiveSupport
    end while User.exists?(column => self[column]) # Makes sure that no two users have the same password reset token.
  end
  
  
  ####### Class Methods
  before_create :send_welcome_email
  def send_welcome_email
    UserMailer.welcome(self, self.password).deliver
  end
  
  before_validation :create_password, on: :create, :if => "password.blank?"
  def create_password
    consonants = %w(b c d f g h j k l m n p qu r s t v w x z ch cr fr nd ng nk nt ph pr rd sh sl sp st th tr)
    vowels = %w(a e i o u y)
    i, password = true, ''
    8.times do
      password << (i ? consonants[rand * consonants.size] : vowels[rand * vowels.size])
      i = !i
    end
    self.password = password
  end
  
  
  ####### Instance Methods
  # empty
  
end
