When %r{click on "([^"]*)"} do |name|
  click_link name
end

When %r{press "([^"]*)"} do |name|
  click_button name
end

#Capybara and Selenium
# When /^accept popup confirmation$/ do
#   page.driver.browser.switch_to.alert.accept
# end
# 
# When /^decline popup confirmation$/ do
#   page.driver.browser.switch_to.alert.dismiss
# end

#Capybara-Webkit
When /^preemptively accept confirmation alert$/ do
  page.evaluate_script("window.confirm = function() { return true; }")
end

When /^preemptively decline confirmation alert$/ do
  page.evaluate_script("window.confirm = function() { return false; }")
end


Then %r{I should see "([^"]*)"} do |blurb|
  page.should have_content(blurb)
end

Then %r{I go to the home page} do 
  visit(root_path)
end

