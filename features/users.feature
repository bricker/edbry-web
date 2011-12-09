Feature: User Management
	In order to maintain order in the universe
	A user with the proper permissions
	Should be able to manage other users
	
	Background:
	 	Given I have logged in
		And I am on the users page
		
	Scenario: List users
		Given a user named "Robert Paulson"
		Then I should see "Robert Paulson" in the users list
	
	Scenario: Visit new user form
		When I go to the new user page
		Then I should see the new user form
	
	Scenario: Attempt to add invalid user
		When I go to the new user page
		And I submit the form
		Then I should see the new user form
		And I should be notified of errors
	
	Scenario: Add valid user
		When I go to the new user page
		And I fill in "user name" with "Paul Robertson"
		And I submit the form
		Then I should see a success message
	 	And I should be on Paul Robertson's profile page
	
	Scenario: Edit user, fields valid
		When I go to the edit user page for "Robert Paulson"
		And I fill in "user name" with "Ron Swanson"
		And I submit the form
		Then I should see a success message
	 	And I should be on Ron Swanson's profile page
	
	Scenario: Edit user, fields invalid
	
	Scenario: Remove user