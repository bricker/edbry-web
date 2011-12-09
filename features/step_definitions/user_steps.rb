Given /^I am a user with name "([^\"]*)" and password "([^\"]*)"$/ do |name, password|
  user = Factory(:user, :name => name, :password => password)
end

Given /^a user named "([^\"]*)"$/ do |name|
  user = Factory(:user, :name => name)
end

Given /^I have logged in$/ do
  user = Factory(:user)
  visit login_path
  fill_in 'name', :with => user.name
  fill_in 'password', :with => user.password
  find('input[type=submit]').click
  current_path.should eq(root_path)
end