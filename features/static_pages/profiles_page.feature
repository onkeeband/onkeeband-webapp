@static_pages @profiles_page
Feature:  Profile Page
	In order to find contact information about On Kee
	As a user / visitor
	I want to see the band booking information with the following:
	name, position/title, email address, and phone number
	
	Scenario:  View 1st level Profile Page
		Given I am on the homepage
		When I go to the profiles page
		Then I should see "Profiles & Bios"
	
	@javascript
	Scenario Outline:  Ensure Individual Profiles and URL Paths
		When I go to the profiles page
			And I click on tab `<profile_tab>` with profile `<name>`
		Then I should see the individual's profile page containing the following info: `<name>` `<title>`
			And the individual profile url path: `<profile_path>`
		
	Examples:
		| name		    			 | title 				  | profile_path 		    | profile_tab	   		|	
		| Lenny McLean  			 | Founder / Band Leader  | /management/lenny 	    | Band Management 	 	|
		| Anita Truitt  			 | Executive Manager	  | /management/anita 	    | Band Management 	 	|
		| David Romaine 			 | Manager 				  | /profiles		 	    | Band Management 	 	|
		| Aubrey McKoy  			 | Bass Guitarist		  | /washington-dc/aubrey   | Washington D.C. Band 	|
		| Cornell Webb    			 | Drummer				  | /washington-dc/cornell  | Washington D.C. Band 	|
		| Ralph "Rhube" Peters  	 | Saxophone			  | /washington-dc/rhube    | Washington D.C. Band 	|
		| David Dillard				 | Percussionist		  | /washington-dc/david    | Washington D.C. Band 	|
		| Lenny McLean			     | Composer / Keyboardist | /washington-dc/lenny    | Washington D.C. Band 	|
		| Greg Silva    			 | Bass Guitarist		  | /profiles			    | Boston Band 		 	|
		| Darren Fry    			 | Drummer				  | /profiles			    | Boston Band 		 	|
		| Rasheed Meadows  			 | Saxophone			  | /profiles			    | Boston Band 		 	|
		| Carl Parks				 | Percussionist		  | /profiles			    | Boston Band 		 	|
		| Lenny McLean			     | Composer / Keyboardist | /boston/lenny  		    | Boston Band 		 	|
		| Michael Smith				 | Featured Guest		  | /profiles				| Featured Guest		|
		| Steve "The Truth" Williams | Featured Guest		  | /featured-guest/steve   | Featured Guest		|
		| Rodney Kelley Sr.			 | Featured Guest		  | /profiles				| Featured Guest		|
		| Lori Dow					 | Featured Guest		  | /profiles			    | Featured Guest		|
		