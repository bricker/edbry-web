Feature: User Management
	In order to maintain order in the universe
	A user with the proper permissions
	Should be able to manage other users
	
	Background:
	 	Given I have logged in
		
	Scenario: List users
		Given a user named "Paul Robertson"
		When I go to the users page
		Then I should see "Paul Robertson" in the users list
	
	Scenario: Visit new user form
		When I go to the new user page
		Then I should see the new user form
	
	Scenario: Attempt to add invalid user
		When I go to the new user page
		And I submit the form
		Then I should see the new user form
		And I should be notified of errors
		
	Scenario: Attempt to add user with name or e-mail that already exists
		Given a user named "Paul Robertson"
		When I go to the new user page
		And I fill in "user name" with "Paul Robertson"
		And I fill in "user email" with "paulrobertson@example.com"
		And I submit the form
		Then I should see the new user form
		And I should be notified of 2 errors
	
	Scenario: Add valid user
		When I go to the new user page
		And I fill in "user name" with "Paul Robertson"
		And I fill in "user email" with "paulrobertson@example.com"
		And I submit the form
		Then I should see a success message
	 	And I should be on Paul Robertson's profile page
	
	Scenario: Edit user, fields valid
		Given a user named "Paul Robertson"
		When I go to the edit user page for "Paul Robertson"
		And I fill in "user name" with "Ron Swanson"
		And I fill in "user email" with "ronswanson@example.com"
		And I submit the form
		Then I should see a success message
	 	And I should be on Ron Swanson's profile page
	
	Scenario: Edit user, fields invalid
		Given a user named "Paul Robertson"
		When I go to the edit user page for "Paul Robertson"
		And I fill in "user name" with ""
		And I fill in "user email" with ""
		And I submit the form
		Then I should see the edit user form for "Paul Robertson"
		And I should be notified of errors
	
	Scenario: Remove user
		Given a user named "Paul Robertson"
		When I go to the edit user page for "Paul Robertson"
		And I follow "delete"
		Then I should be on the users page
		And I should see a success message
		And I should not see "Paul Robertson" in the users list