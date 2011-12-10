require "spec_helper"

describe User do
  describe "password reset" do
    let(:user) { Factory(:user) }
    
    it "generates a unique password_reset_token each time" do
      user.send_password_reset
      last_token = user.password_reset_token
      user.send_password_reset
      user.password_reset_token.should_not eq(last_token)
    end
    
    it "saves the time the password reset was requested" do
      user.send_password_reset
      user.reload.password_reset_requested_at.should be_present
    end
    
    it "delivers email to user" do
      user.send_password_reset
      last_email.to.should include(user.email)
    end
  end
  
  describe "create a user" do
    let(:user) { Factory(:user) }
    
    it "creates a new user" do
      user = Factory(:user)
      User.all.count.should eq(1)
    end
    
    it "encrypts the password" do
      user = Factory(:user)
      BCrypt::Password.new(user.password_digest).should eq("secret")
    end
    
    it "sends a welcome e-mail" do
      user = Factory(:user, email: "new-user@example.com")
      last_email.to.should include("new-user@example.com")
    end
  end
  
# it "authenticates user" do
#   user = Factory(:user, email: "authed_user@example.com")
#   User.authenticate('authed_user@example.com', 'secret').should == user
# end
end
