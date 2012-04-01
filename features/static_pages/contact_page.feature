@static_pages @contact_page
Feature:  Contact Page
	In order to find contact information about On Kee
	As a user / visitor
	I want to see the band booking information with the following:
	name, position/title, email address, and phone number
	
	Scenario:  View Contact Page
		Given I am on the homepage
		When I go to the contact page
		Then I should see "Contact Us"
	
	Scenario Outline:  Ensure Correct Booking Information
		When I go to the contact page
		Then I should see the booking info for the following `<name>` `<title>` `<email>` `<phone>`		
		
	Examples:
		| name 		    | title 				| email 			  | phone		   |
		| Lenny McLean  | Founder / Band Leader | lenny@onkeeband.com | (508) 740-2470 |
		| Anita Truitt  | Executive Manager	    | anita@onkeeband.com | (443) 827-1693 |
		| David Romaine | Manager 				| david@onkeeband.com | (201) 218-0743 |