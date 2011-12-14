Given /^(?:|I am )a user named "([^\"]*)" with password "([^\"]*)"$/ do |name, password|
  @me = Factory(:user, name: name, password: password)
end

Given /^(?:|I am )a user named "([^\"]*)"$/ do |name|
  @user = Factory(:user, name: name)
end

Given /^I have logged in$/ do
  @me ||= Factory(:user)
  visit login_path
  fill_in 'name', with: @me.name
  fill_in 'password', with: @me.password
  find('input[type=submit]').click
  current_path.should eq(root_path)
end

Given /^I have not logged in$/ do
  # nothing... this is just here for the tables
end

Given /^I have logged in as "([^"]*)"$/ do |name|
  @me ||= Factory(:user)
  visit login_path
  fill_in 'name', with: @me.name
  fill_in 'password', with: @me.password
  find('input[type=submit]').click
  current_path.should eq(root_path)
end

When /^I login with name "([^"]*)" and password "([^"]*)"$/ do |name, password|
  visit login_path
  fill_in "name", with: name
  fill_in "password", with: password
  find('input[type=submit]').click
end