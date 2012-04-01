Given /^there are currently no events$/ do
  Event.count.should == 0
end

Given /^a valid event already exists$/ do
  #FactoryGirl.create(:valid_event)
  step %{a valid "public" event already exists}
end

Given /^a valid "(.*)" event already exists$/ do |type|
  type == "public" ? FactoryGirl.create(:valid_event) : FactoryGirl.create(:valid_event, :private_event => true)
end

When /^I go the the events page$/ do
  visit(events_path)
end

When /^enter the following information for the event$/ do |table|
  # table is a Cucumber::Ast::Table
  table.transpose.hashes.map do |event|
    fill_in 'Venue Name', :with => event[:venue]
    fill_in 'Date', :with => event[:date]
    
    select '12 AM', :from => 'event_begin_time_4i'
    select '00', :from => 'event_begin_time_5i'
    select '03 AM', :from => 'event_end_time_4i'
    select '00', :from => 'event_end_time_5i'
    
    fill_in 'Website URL', :with => event[:website_url]
    fill_in 'Price', :with => event[:price]
    select event[:admission_type], :from => 'Admission Type'
    
    fill_in 'Address Line 1', :with => event[:first_line]
    fill_in 'Address Line 2', :with => event[:second_line]
    fill_in 'City', :with => event[:city]
    fill_in 'State / Province', :with => event[:state]
    select event[:country], :from => 'Country'
    
    fill_in 'Notes', :with => event[:notes]     
  end
end

When %r{enter valid information for a private event} do
  @event = Factory.build(:valid_event, :private_event => true)
  fill_in 'Venue Name', :with => @event.venue_name
  fill_in 'Date', :with => @event.date
  
  fill_in 'Website URL', :with => @event.website_url
  fill_in 'Price', :with => @event.price
  select @event.admission_type, :from => 'Admission Type'
  check 'Private Occasion'
  
  fill_in 'City', :with => @event.city
  fill_in 'State / Province', :with => @event.state
  select @event.country, :from => 'Country'
  
  fill_in 'Notes', :with => @event.notes
end

When %r{select the first event entry} do
  click_link 'Edit'
end

When %r{edit the event to be a private event} do
  check 'Private Occasion'
end
  
Then /^I should see that the Event has been added$/ do
  page.should have_content("Event was successfully created.")
end

Then /^there should still be an event listed$/ do
  Event.count.should > 0
  step %{I should see "Remove"}
end



Then %r{I should see event errors} do 
  pending
  # step %{I should see "Date can't be in the past"}
  # step %{I should see "Remove"}
  # step %{I should see "Remove"}
end

Then /^I should see that the Event is now updated$/ do
  page.should have_content("Event was successfully updated.")
end

Given /^a valid private event already exists$/ do
  pending # express the regexp above with the code you wish you had
end

When /^edit the event with invalid info$/ do
  pending # express the regexp above with the code you wish you had
end