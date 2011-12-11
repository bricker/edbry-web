When /^I submit a password reset request using my e-mail$/ do
  visit new_password_reset_path
  fill_in "email", with: @me.email
  find('input[type=submit]').click
  @me.reload
  @me.password_reset_token.should_not eq nil
end

When /^I submit a password reset request using e-mail "([^"]*)"$/ do |email|
  visit new_password_reset_path
  fill_in "email", with: email
  find('input[type=submit]').click
end

When /^I reset my password to "([^"]*)"$/ do |password|
  fill_in "user_password", with: password
  fill_in "user_password_confirmation", with: password
  find('input[type=submit]').click
  @me.reload
end

Then /^my password should be "([^"]*)"$/ do |password|
  BCrypt::Password.new(@me.password_digest).should eq password
end

Then /^there should be no password reset token generated$/ do
  User.where("password_reset_token IS NOT NULL").all.should be_empty
end

Then /^I should have a password reset token$/ do
  @me.password_reset_token.should_not eq nil
end

When /^an hour has passed since I requested a password reset$/ do
  @me.update_attribute(:password_reset_requested_at, 1.hour.ago)
end