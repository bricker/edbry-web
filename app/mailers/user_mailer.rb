class UserMailer < ActionMailer::Base
  default from: "Edbry-Web <edbryweb@edbryweb.com>" # TODO put the real name/e-mail here
  
  def password_reset(user)
    @user = user
    mail to: "#{user.name} <#{user.email}>", subject: "Password Reset for Edbry-Web" # TODO put the real name here
  end
  
  def welcome(user, password)
    @user = user
    @password = password
    mail to: "#{user.name} <#{user.email}>", subject: "Login information for Edbry-Web" # TODO put the real name here
  end
end
