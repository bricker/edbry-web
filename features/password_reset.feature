Feature: Password Reset
	In order to login
	A user
	Should be able to reset his/her password should it be forgotten
	
	Background:
		Given I am a user named "Ron Swanson" with password "secret"
	
	Scenario: Visit the Password Reset page
		When I go to the forgot password page
		Then I should see the new password reset form
		
	Scenario: Submit Request with an invalid e-mail
		When I submit a password reset request using e-mail "not-registered@example.com"
		Then I should be on the login page
		And I should see a success message
		And there should be no password reset token generated
	
	Scenario: Submit Request with valid e-mail
		When I submit a password reset request using my e-mail
		Then I should be on the login page
		And I should see a success message
		And I should have a password reset token
		
	Scenario: Attempt to reset password if token has expired
		When I submit a password reset request using my e-mail
		And an hour has passed since I requested a password reset
		And I go to the reset password page e-mailed to me
		Then I should be on the new password reset page
		And I should see a failure message
		
	Scenario: Visit reset password page within the expiration limit
		When I submit a password reset request using my e-mail
		And I go to the reset password page e-mailed to me
		Then I should see the password reset form
		
	Scenario: Visit reset password page with invalid token
		When I submit a password reset request using my e-mail
		And I go to the reset password page with an invalid token
		Then I should be on the new password reset page
		And I should see a failure message
		
	Scenario: Mismatched Password Confirmation
		When I submit a password reset request using my e-mail
		And I go to the reset password page e-mailed to me
		And I fill in "user password" with "new_secret"
		And I fill in "user password confirmation" with "wrong"
		And I submit the form
		Then I should see the password reset form
		And I should be notified of errors
		And my password should be "secret"
		
	Scenario: Reset Password
		When I submit a password reset request using my e-mail
		And I go to the reset password page e-mailed to me
		And I reset my password to "new_secret"
		Then I should be on the login page
		And I should see a success message
		And my password should be "new_secret"
		
	Scenario: Login with a new password
		When I submit a password reset request using my e-mail
		And I go to the reset password page e-mailed to me
		And I reset my password to "new_secret"
		And I login with name "Ron Swanson" and password "new_secret"
		Then I should be on the home page
		And I should see a success message