Feature: Blog Posts
	In order to communicate our development process with potential clients
	A user
	Should be able to make blog posts
	
	Scenario: Attempt to add an invalid post
		Given I have logged in
		When I go to the new post page
		And I submit the form
		Then I should see the new post form
		And I should be notified of errors

	Scenario: Add a post
		Given I have logged in
		When I go to the new post page
		And I fill out the post form
		And I submit the form
		Then I should be on the post's page
		And there should be 1 post
	
	Scenario: Edit a post, invalid fields
		Given I have logged in
		And a post
		When I go to the edit page for the post
		And I fill out the post form with empty fields
		And I submit the form
		Then I should see the edit post form
		And I should be notified of errors
	
	Scenario: Edit a post, valid fields
		Given I have logged in
		And a post
		When I go to the edit page for the post
		And I fill in "post title" with "Edited Blog Post"
		And I submit the form
		Then I should be on the post's page
		And I should see "Edited Blog Post"

	Scenario: Delete a post
		Given I have logged in
		And a post
		When I go to the edit page for the post
		And I follow "delete"
		Then I should be on the posts page
		And there should be 0 posts
	
	Scenario: List posts
		Given a post
		When I go to the posts page
		Then I should see "Blog Post" in the posts list
		
	Scenario: Show post
		Given a post
		When I go to the post's page
		Then I should see "Blog Post"
		
	Scenario: Attempt to add post without proper permission
		When I go to the new post page
		Then I should see the login form
		And I should see a failure message
	
	Scenario: Attempt to edit post without proper permission
		Given a post
		When I go to the edit page for the post
		Then I should see the login form
		And I should see a failure message
		
	Scenario Outline: Link Visibility
		Given a post
		And I have <login_status>
		And I am on the posts page
		Then I <visibility> see "<link>"
		
	Examples: Link Visibility Options
		| login_status		| visibility	| link		|
		| not logged in		| should not	| Add Post	|
		| not logged in		| should not	| Edit Post	|
		| logged in			| should		| Add Post	|
		| logged in			| should		| Edit Post	|