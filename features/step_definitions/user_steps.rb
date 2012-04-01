Given /^I am successfully signed in with the following credentials$/ do |table|
  table.hashes.map do |row|
    step %{I sign in as "#{row[:username]}/#{row[:password]}"}
  end
end

Given /^no user exists with an email of "(.*)"$/ do |email|
  User.find(:first, :conditions => { :email => email }).should be_nil
end

Given /^I am a user named "([^"]*)" with an email "([^"]*)" and password "([^"]*)"$/ do |name, email, password|
  FactoryGirl.create(:admin)
  # User.new(:name => name,
  #             :email => email,
  #             :password => password,
  #             :password_confirmation => password).save!
end

Given /^I am signed up as "(.*)\/(.*)"$/ do |email, password|
  Given %{I am not logged in}
  When %{I go to the sign up page}
  And %{I fill in "Email" with "#{email}"}
  And %{I fill in "Password" with "#{password}"}
  And %{I fill in "Password confirmation" with "#{password}"}
  And %{I press "Sign up"}
  Then %{I should see "You have signed up successfully. If enabled, a confirmation was sent to your e-mail."}
  And %{I am logout}
end

Then /^I sign out$/ do
  visit('/users/sign_out')
end

Given /^I am logout$/ do
  Given %{I sign out}
end

Given /^I am not logged in$/ do
  visit('/logout')
end

When /^I go to the sign in page$/ do
  visit('/login')
end

When %r{I fill in "Email" with "(.*)"} do |email|
  fill_in 'Email', :with => email
end

When %r{I fill in "Password" with "(.*)"} do |password|
  fill_in 'Password', :with => password
end

# When %r{I press "Sign in"} do 
#   click_button 'Sign in'
# end


When /^I sign in as "(.*)\/(.*)"$/ do |email, password|
  @current_user = FactoryGirl.create(:admin)
  step %{I am not logged in}
  step %{I go to the sign in page}
  step %{I fill in "Email" with "#{email}"}
  step %{I fill in "Password" with "#{password}"}
  step %{I press "Sign in"}
  
end
# Then %r{I should see "(.*)"} do |text|
#   page.should have_content(text)
# end

Then /^I should be signed in$/ do
  Then %{I should see "Signed in successfully."}
end

Then /^I should be already signed in$/ do
  And %{I should see "Logout"}
end

When /^I return next time$/ do
  And %{I go to the home page}
end

Then /^I should be signed out$/ do
  step %{I should see "Sign up"}
  step %{I should see "Login"}
  step %{I should not see "Logout"}
end
