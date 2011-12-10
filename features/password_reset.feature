Feature: Password Reset
	In order to login
	A user
	Should be able to reset his/her password should it be forgotten
	
	Background:
		Given I am a user named "Ron Swanson"
	
	Scenario: Visit the Password Reset page
		When I go to the new password reset page
		Then I should see the new password reset form
		
	Scenario: Submit Request with an invalid e-mail
		When I go to the new password reset page
		And I fill in "email" with "not-registered@example.com"
		And I submit the form
		Then I should be on the login page
		And I should see a success message
		And "Ron Swanson" should not have a password reset token
			
	Scenario: Submit Request with valid e-mail
		When I go to the new password reset page
		And I fill in "email" with "ron-swanson@example.com"
		And I submit the form
		Then I should be on the login page
		And I should see a success message
		And "Ron Swanson" should have a password reset token
		
	Scenario: Attempt to reset password if token has expired
		When I go to the new password reset page
		And I fill in "email" with "ron-swanson@example.com"
		And I submit the form
		And an hour has passed since I requested a password reset
		And I go to the edit password reset page for "Ron Swanson"
		Then I should be on the new password reset page
		And I should see a failure message
		
	Scenario: Reset Password