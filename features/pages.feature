Feature: Pages
	In order to manage and view static content on the website
	A user
	Should be able to manage pages
	
	Scenario: Attempt to add an invalid page
		Given I have logged in
		When I go to the new page page
		And I submit the form
		Then I should see the new page form
		And I should be notified of errors
		And there should be 0 pages

	Scenario: Add a page
		Given I have logged in
		When I go to the new page page
		And I fill out the page form
		And I submit the form
		Then I should be on the page's page
		And there should be 1 page
	
	Scenario: Edit a page, invalid fields
		Given I have logged in
		And a page
		When I go to the edit page for the page
		And I fill out the page form with empty fields
		And I submit the form
		Then I should see the edit page form
		And I should be notified of errors
	
	Scenario: Edit a page, valid fields
		Given I have logged in
		And a page
		When I go to the edit page for the page
		And I fill in "page title" with "New Page Title"
		And I submit the form
		Then I should be on the page's page
		And I should see "New Page Title"

	Scenario: Delete a page
		Given I have logged in
		And a page
		When I go to the edit page for the page
		And I follow "delete"
		Then I should be on the home page
		And there should be 0 pages
		
	Scenario: Show page
		Given a page
		When I go to the page's page
		Then I should see "Page Title"
		
	Scenario: Attempt to add page without proper permission
		When I go to the new page page
		Then I should see the login form
		And I should see a failure message
	
	Scenario: Attempt to edit page without proper permission
		Given a page
		When I go to the edit page for the page
		Then I should see the login form
		And I should see a failure message
		
	Scenario Outline: Link Visibility
		Given a page
		And I have <login_status>
		And I am on the <page> page
		Then I <visibility> see "<link>"
		
	Examples: Link Visibility Options
		| login_status		| page		| visibility	| link		|
		| not logged in		| home		| should not	| Add Page	|
		| logged in			| home		| should		| Add Page	|
		| not logged in		| page's	| should not	| Edit Page	|
		| logged in			| page's	| should		| Edit Page	|