@events @add_event
Feature:  Adding Events
	In order to manage upcoming and past gigs
	Band members and administrators should be able to 
	add an event to the listing of events ordered by date

	Background:
		Given I am successfully signed in with the following credentials
			| username 			  | password | 
			| user1@example1.com  | please   |

	@public_event	
	Scenario: Add a public event
		Given there are currently no events
		When I go the the events page
			And click on "+"
			And enter the following information for the event			
				| venue 	  	 | PlaceA											    |
				| date		  	 | Time.parse("March 19th, 2013, 7:30 pm").to_s(:db)  	|
				| website_url 	 | http://www.theplacea.com				    		    | 
				| price		  	 | 10.00									    	    |
				| admission_type | Ticket Event								    	    |
				| first_line	 | 123 Anystreet St.						    	    |
				| city			 | Anytown											    |
				| state			 | MD												    |
				| country		 | United States									    |
				| notes		  	 | This is a Jazz Concert Series			      	    |
			And press "Save"
		Then I should see that the Event has been added

	@private_event
	Scenario: Add a private event w/o address or event times
		When I go the the events page
			And click on "+"
			And enter valid information for a private event
			And press "Save"
		Then I should see that the Event has been added

	@invalid_event
	Scenario: Don't allow a blank form to pass validation
		Given there are currently no events
		When I go the the events page
			And click on "+"
			And press "Save"
		Then I should see "can't be blank"
		