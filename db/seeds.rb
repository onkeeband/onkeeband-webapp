# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
puts 'EMPTY THE MONGODB DATABASE'
Mongoid.master.collections.reject { |c| c.name =~ /^system/}.each(&:drop)

puts 'SETTING UP DEFAULT USER LOGIN'
(1..2).each do |id|
  user = User.create! :name => "Name#{id}", :email => "user#{id}@example#{id}.com", :password => 'please', :password_confirmation => 'please'
  puts 'New user created: ' << user.name
  puts 'User email' << user.email
end
