class User < ActiveRecord::Base
  has_secure_password # This is built into Rails 3.1. It gives us the "authenticate" method and the "password=" method. Also validates password confirmation. Uses BCrypt.
  validates :name, :presence => true
  
  before_validation :create_password, :on => :create
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
  
end
