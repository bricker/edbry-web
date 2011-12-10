Feature: User Authentication
	In order to manage the content of the website
	A user with the proper permissions
	Should be able to login and logout
	
	Background:
		Given I am on the login page
		And I am a user with name "Robert Paulson" and password "secret"
	
	Scenario: Try to access protected page without logging in
		When I go to the users page
		Then I should be on the login page
		And I should see a failure message
		
	Scenario: Login Page
		When I go to the login page
		Then I should see the login form
		
	Scenario: Blank form is submitted
		When I submit the form
		Then I should see the login form
		And I should see a failure message
		
	Scenario: Name and Password are incorrect
		When I fill in "name" with "Paul Robertson"
		And I fill in "password" with "wrong"
		And I submit the form
		Then I should see the login form
		And I should see a failure message
		
	Scenario: Only name is incorrect
		When I fill in "name" with "Paul Robertson"
		And I fill in "password" with "secret"
		And I submit the form
		Then I should see the login form
		And I should see a failure message
				
	Scenario: Only password is incorrect
		When I fill in "name" with "Robert Paulson"
		And I fill in "password" with "wrong"
		And I submit the form
		Then I should see the login form
		And I should see a failure message
		
	Scenario: Name and Password are correct
		When I fill in "name" with "Robert Paulson"
		And I fill in "password" with "secret"
		And I submit the form
		Then I should be on the home page
		And I should see a success message
		
	Scenario: Logout
		When I go to the logout page
		Then I should see a success message
		And I should be on the home page