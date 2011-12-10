Given /^I am a user with name "([^\"]*)" and password "([^\"]*)"$/ do |name, password|
  user = Factory(:user, name: name, password: password)
end

Given /^(?:|I am )a user named "([^\"]*)"$/ do |name|
  @user = Factory(:user, name: name)
end

Given /^I have logged in$/ do
  user = Factory(:user)
  visit login_path
  fill_in 'name', with: user.name
  fill_in 'password', with: user.password
  find('input[type=submit]').click
  current_path.should eq(root_path)
end

Then /^"([^\"]*)" should not have a password reset token$/ do |name|
  user = User.find_by_name(name)
  user.password_reset_token.should eq nil
end

Then /^"([^\"]*)" should have a password reset token$/ do |name|
  user = User.find_by_name(name)
  user.password_reset_token.should_not eq nil
end

When /^an hour has passed since I requested a password reset$/ do
  @user.update_attribute(:password_reset_requested_at, 1.hour.ago)
end