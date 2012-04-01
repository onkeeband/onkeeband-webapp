@javascript @events @delete_event
Feature:  Delete Event
	In order to manage upcoming and past gigs
	Band members and administrators should be able to 
	remove a previously existing event
	
	Background:
		Given I am successfully signed in with the following credentials
			| username 			  | password | 
			| user1@example1.com  | please   |
		And a valid event already exists
		
	Scenario: Remove an Event
		When I go the the events page
			And preemptively accept confirmation alert
			And click on "Remove"
		Then I should see "Event has been removed"
	
	Scenario: Mistakenly press "Remove" link for an event
		When I go the the events page
			And preemptively decline confirmation alert
			And click on "Remove"
		Then there should still be an event listed