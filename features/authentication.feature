Feature: User Authentication
	In order to manage the content of the website
	A user with the proper permissions
	Should be able to login and logout
	
	Background:
		Given I am on the login page
	
	Scenario: Login via link
		Given I go to the home page
		And I follow "Login"
		Then I should be on the login page
		
	Scenario: Try to access protected page without logging in
		When I go to the users page
		Then I should be on the login page
		And I should see a failure message
		
	Scenario: Login Page
		When I go to the login page
		Then I should see the login form
	
	Scenario: User who is already logged in
		Given I have logged in as "Ron Swanson"
		When I go to the login page
		Then I should be on the home page
		And I should see a success message
	
	Scenario: Logout
		Given I have logged in as "Ron Swanson"
		When I go to the logout page
		Then I should see a success message
		And I should be on the home page
		And I should not see "Logout"
		
	Scenario: Logout via link
		Given I have logged in as "Ron Swanson"
		And I am on the home page
		When I follow "Logout"
		Then I should see a success message
		And I should be on the home page
		And I should not see "Logout"
	
	Scenario Outline: Login with various Login Details
		Given I am a user named "Ron Swanson" with password "secret"
		When I fill in "name" with "<name>"
		And I fill in "password" with "<password>"
		And I submit the form
		Then I should <action>
		And I should see a <flash> message
		
	Examples: Login Details
		| name			 | password	 | action				| flash	   |
		| 				 |			 | see the login form	| failure  |
		| Ann Perkins	 |	wrong	 | see the login form	| failure  |
		| Ann Perkins	 |	secret	 | see the login form	| failure  |
		| Ron Swanson	 |	wrong	 | see the login form	| failure  |
		| Ron Swanson	 |	secret	 | be on the home page	| success  |
		