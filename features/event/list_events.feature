Feature:  List Events
	In order to view upcoming and past gigs
	visitors and administrators should be able to 
	view events on the homepage and the events page based on user status
	
	Scenario: View Events on Homepage as a visitor
		Given I am a visitor 
		When I go to the events page
		Then I should see at least one or more events