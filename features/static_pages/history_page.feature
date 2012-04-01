@static_pages @history_page
Feature:  Band History Page
	In order to find historical info about On Kee
	As a user / visitor
	I want to see the On Kee Jazz Band History page
	
	Scenario:  View History Page
		Given I am on the homepage
		When I go to the history page
		Then I should see "On Kee Jazz Band has been providing smooth and jazzy live entertainment since 1993."