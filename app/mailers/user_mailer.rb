class UserMailer < ActionMailer::Base
  default from: "#{AppConfig['company']['name']} <#{AppConfig['company']['email']}>"
  
  def password_reset(user)
    @user = user
    mail to: "#{user.name} <#{user.email}>", subject: "Password Reset for #{AppConfig['company']['name']}"
  end
  
  def welcome(user, password)
    @user = user
    @password = password
    mail to: "#{user.name} <#{user.email}>", subject: "Login information for #{AppConfig['company']['name']}"
  end
end
