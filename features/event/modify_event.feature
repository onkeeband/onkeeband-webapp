@events @modify_event
Feature:  Modify Events
	In order to manage upcoming and past gigs
	Band members and administrators should be able to 
	modify any event listed 
	
	Background:
		Given I am successfully signed in with the following credentials
			| username 			  | password | 
			| user1@example1.com  | please   |
	
	@public_event	
	Scenario: Modify a public event to a private event
		Given a valid "public" event already exists
		When I go the the events page
			And select the first event entry
			And edit the event to be a private event
			And press "Save"
		Then I should see that the Event is now updated
	# 	And only the city and state portion of the address is shown
	# 
	# @private_event
	# Scenario: Modify a private event to a public event
	# 	Given a valid "private" event already exists
	# 	When I go the the events page
	# 		And click on "Add Show"
	# 		And enter valid information for a private event
	# 		And press "Save"
	# 	Then I should see that the Event is now private
	# 
	# @invalid_event
	# Scenario: I try to modify an event with invalid information
	# 	Given a valid "private" event already exists
	# 	When I go the the events page
	# 		And edit the event with invalid info
	# 		And press "Save"
	# 	Then I should see "can't be blank"
