Given /^I am on the homepage$/ do
  visit(root_path)
  current_path.should == root_path
end



When /^I go to the history page$/ do
  #visit("/history")
  click_link "History"
  current_path.should == history_path
end
When /^I go to the contact page$/ do
  visit(contact_path)
  current_path.should == contact_path
end
When /^I go to the profiles page$/ do
  visit(profiles_path)
  current_path.should == profiles_path
end
# When /^I click on tab `(.*)`/ do |tab|
#   find_link(tab).click   if find_link(tab).visible?
# end
When /^I click on tab `(.*)` with profile `(.*)`/ do |tab, name|
  click_on tab
  click_link(name)
end


Then /^I should see the booking info for the following `(.*)` `(.*)` `(.*)` `(.*)`$/ do |arg1, arg2, arg3, arg4|
  page.should have_content(arg1)
  page.should have_content(arg2)
  page.should have_content(arg3)
  page.should have_content(arg4)
end
Then /^I should see the individual's profile page containing the following info: `(.*)` `(.*)`$/ do |name, title|
  page.should have_content(name)
  page.should have_content(title)
end
Then /^the individual profile url path: `(.*)`/ do |url_path|
  current_path.should == url_path
end