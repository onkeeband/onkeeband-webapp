@static_pages @profiles_page
Feature:  Profile Page
	In order to browse detailed information about an On Kee band member
	As a user / visitor
	I want to visit the individual profiles of each band member 
	
	Scenario:  View Profiles page with profile groups
		Given I am on the homepage
		When I go to the profiles page
		Then I should see "Profiles & Bios"
	
	@javascript
	Scenario Outline:  View Individual Profiles following unique URL Paths
		When I go to the profiles page
			And I click on tab `<profile_tab>` with profile `<name>`
		Then I should see the individual's profile page containing the following info: `<name>` `<title>`
			And the individual profile url path: `<profile_path>`
		
	Examples:
		| name		    			 | title 				  | profile_path 		    | profile_tab	   		|	
		| Lenny McLean  			 | Founder / Band Leader  | /management/lenny 	    | Band Management 	 	|
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
		| Rodney Kelley Sr.			 | Featured Guest		  | /profiles				| Featured Guest		|
		| Lori Dow					 | Featured Guest		  | /profiles			    | Featured Guest		|
		