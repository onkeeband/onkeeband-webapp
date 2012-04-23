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


# Retro-fit Past Events
EVENTS = [
          {:venue_name => "Atlantic City Multicultural Festival", :date => Time.new(2012,06,03).to_s(:db), :begin_time => Time.parse("4:00pm"), :end_time => Time.parse("9:00pm"), 
          :website_url => "http://www.pressofatlanticcity.com/communities/atlantic-city_pleasantville_brigantine/atlantic-city-multicultural-festival-planned-for-june/article_57fb090e-7e07-11e1-9632-001a4bcf887a.html", :price => 0.00, :admission_type => "cover", :private_event => false, :published => true, 
          :pub_date => (Time.new(2012,04,23)).to_s(:db), :notes => "", 
          :address => {:first_line => "The Kennedy Plaza", :second_line => "Mississippi Ave at The Boardwalk", :city => "Atlantic City", :state => "NJ", :country => "United States"}},
          
          {:venue_name => "Sunday Jazz Brunch", :date => Time.new(2012,05,13).to_s(:db), :begin_time => Time.parse("11:00am"), :end_time => Time.parse("3:00pm"), 
          :website_url => "http://www.sundayjazzbrunch.net/", :price => 25.00, :admission_type => "ticket", :private_event => false, :published => true, 
          :pub_date => (Time.new(2012,04,23)).to_s(:db), :notes => "Special Mother's Day Event.", 
          :address => {:first_line => "Sheraton BWI Hotel", :second_line => "1100 Old Elkridge Landing Road", :city => "Linthicum Heights", :state => "MD", :country => "United States"}},
          
          {:venue_name => "National Sales Network", :date => Time.new(2012,04,19).to_s(:db), :begin_time => Time.parse("6:00pm"), :end_time => Time.parse("9:00pm"), 
          :website_url => "#", :price => 0.00, :admission_type => "cover", :private_event => true, :published => true, 
          :pub_date => (Time.new(2012,04,19) - 1.week).to_s(:db), :notes => "", 
          :address => {:first_line => "3000 K Street, NW", :second_line => "", :city => "Washington", :state => "DC", :country => "United States"}},
          
          {:venue_name => "Moulin de Paris", :date => Time.new(2011,12,21).to_s(:db), :begin_time => Time.parse("2:00pm"), :end_time => Time.parse("5:00pm"), 
          :website_url => "http://www.moulindeparismd.com/", :price => 0.00, :admission_type => "cover", :private_event => true, :published => true, 
          :pub_date => (Time.new(2011,12,21) - 1.week).to_s(:db), :notes => "", 
          :address => {:first_line => "31 Magothy Beach Rd. Suite 105", :second_line => "", :city => "Pasadena", :state => "MD", :country => "United States"}},
          
          {:venue_name => "Aloft Hotel Arundel Mills", :date => Time.new(2011,12,16).to_s(:db), :begin_time => Time.parse("7:00pm"), :end_time => Time.parse("10:00pm"), 
          :website_url => "http://www.starwoodhotels.com/alofthotels/property/overview/index.html?propertyID=3050", :price => 0.00, :admission_type => "cover", :private_event => false, :published => true, 
          :pub_date => (Time.new(2011,12,16) - 1.week).to_s(:db), :notes => "", 
          :address => {:first_line => "7520 Teage Rd.", :second_line => "", :city => "Hanover", :state => "MD", :country => "United States"}},
          
          {:venue_name => "Big Easy Restaurant & Lounge", :date => Time.new(2011,12,9).to_s(:db), :begin_time => Time.parse("8:30pm"), :end_time => Time.parse("12:00am"), 
          :website_url => "http://bigeasylounge.webs.com/", :price => 5.00, :admission_type => "cover", :private_event => false, :published => true, 
          :pub_date => (Time.new(2011,12,9) - 1.week).to_s(:db), :notes => "Toy Drive held for children at Kennedy Krieger Institute. Please feel free to donate a toy for this special occasion.", 
          :address => {:first_line => "9820 Liberty Rd.", :second_line => "", :city => "Randallstown", :state => "MD", :country => "United States"}},
          
          {:venue_name => "7th Annual LUPUS Foundation Fundraiser", :date => Time.new(2011,10,8).to_s(:db), :begin_time => Time.parse("9:00pm"), :end_time => Time.parse("12:00am"), 
          :website_url => "http://www.rylesjazz.com", :price => 5.00, :admission_type => "cover", :private_event => false, :published => true, 
          :pub_date => (Time.new(2011,10,8) - 3.week).to_s(:db), :notes => "Sponsored by The LUPUS Foundation of New England", 
          :address => {:first_line => "Ryles Jazz Club", :second_line => "212 Hampshire Street", :city => "Cambridge", :state => "MA", :country => "United States"}},
          
          {:venue_name => "Sunday Jazz Brunch", :date => Time.new(2011,9,25).to_s(:db), :begin_time => Time.parse("11:00am"), :end_time => Time.parse("2:00pm"), 
          :website_url => "http://www.sundayjazzbrunch.net/", :price => 25.00, :admission_type => "ticket", :private_event => false, :published => true, 
          :pub_date => (Time.new(2011,9,25) - 1.week).to_s(:db), :notes => "Feat. Cheryl Goodman from WEAA Radio 88.9 FM Baltimore.  The tickets are $25.00 in advance, $30.00 at door.", 
          :address => {:first_line => "Sheraton BWI Hotel", :second_line => "1100 Old Elkridge Landing Road", :city => "Linthicum Heights", :state => "MD", :country => "United States"}},
          
          {:venue_name => "Eubie Blake Jazz & Cultural Center", :date => Time.new(2011,8,11).to_s(:db), :begin_time => Time.parse("6:00pm"), :end_time => Time.parse("8:00pm"), 
          :website_url => "http://www.eubieblake.org", :price => 0.00, :admission_type => "cover", :private_event => false, :published => true, 
          :pub_date => (Time.new(2011,8,11) - 1.week).to_s(:db), :notes => "Ghana African Mission Photo Exhibit by Tana Lopez", 
          :address => {:first_line => "847 North Howard Street", :second_line => "", :city => "Baltimore", :state => "MD", :country => "United States"}},
          
          {:venue_name => "Annual Fish Fry", :date => Time.new(2011,8,6).to_s(:db), :begin_time => Time.parse("6:00pm"), :end_time => Time.parse("10:00pm"), 
          :website_url => "#", :price => 0.00, :admission_type => "cover", :private_event => true, :published => true, 
          :pub_date => (Time.new(2011,8,6) - 1.week).to_s(:db), :notes => "", 
          :address => {:first_line => "", :second_line => "", :city => "Bowie", :state => "MD", :country => "United States"}}, 
          
          {:venue_name => "Red Element (formerly Si Salsa)", :date => Time.new(2011,7,16).to_s(:db), :begin_time => Time.parse("8:00pm"), :end_time => Time.parse("11:30pm"), 
          :website_url => "#", :price => 10.00, :admission_type => "cover", :private_event => false, :published => true, 
          :pub_date => (Time.new(2011,7,16) - 1.week).to_s(:db), :notes => "", 
          :address => {:first_line => "1700 Reisterstown Rd.", :second_line => "", :city => "Pikesville", :state => "MD", :country => "United States"}},
          
          {:venue_name => "L'Enfant Plaza Hotel", :date => Time.new(2011,7,8).to_s(:db), :begin_time => Time.parse("5:00pm"), :end_time => Time.parse("9:00pm"), 
          :website_url => "http://www.lenfantplazahotel.com", :price => 0.00, :admission_type => "cover", :private_event => false, :published => true, 
          :pub_date => (Time.new(2011,7,8) - 1.week).to_s(:db), :notes => "", 
          :address => {:first_line => "480 L'Enfant Plaza, SW", :second_line => "", :city => "Washington", :state => "DC", :country => "United States"}},
          
          {:venue_name => "The Carlyle Club", :date => Time.new(2011,6,10).to_s(:db), :begin_time => Time.parse("8:00pm"), :end_time => Time.parse("11:00pm"), 
          :website_url => "http://www.thecarlyleclub.com/", :price => 15.00, :admission_type => "ticket", :private_event => false, :published => true, 
          :pub_date => (Time.new(2011,6,10) - 1.week).to_s(:db), :notes => "The tickets are $15 in advance, $20 at door", 
          :address => {:first_line => "411 John Carlyle Street", :second_line => "", :city => "Alexandria", :state => "VA", :country => "United States"}},
          
          {:venue_name => "Latin Palace", :date => Time.new(2011,6,5).to_s(:db), :begin_time => Time.parse("8:00pm"), :end_time => Time.parse("11:00pm"), 
          :website_url => "http://www.latinpalace.com", :price => 15.00, :admission_type => "cover", :private_event => false, :published => true, 
          :pub_date => (Time.new(2011,6,5) - 1.week).to_s(:db), :notes => "$15 in advance, $20 at door", 
          :address => {:first_line => "509 South Broadway", :second_line => "", :city => "Baltimore", :state => "MD", :country => "United States"}},
          
          {:venue_name => "L'Enfant Plaza Hotel", :date => Time.new(2011,5,28).to_s(:db), :begin_time => Time.parse("6:00pm"), :end_time => Time.parse("10:00pm"), 
          :website_url => "http://www.lenfantplazahotel.com", :price => 0.00, :admission_type => "cover", :private_event => false, :published => true, 
          :pub_date => (Time.new(2011,5,28) - 1.week).to_s(:db), :notes => "", 
          :address => {:first_line => "480 L'Enfant Plaza, SW", :second_line => "", :city => "Washington", :state => "DC", :country => "United States"}},
          
          {:venue_name => "Big Easy Restaurant & Lounge", :date => Time.new(2011,5,20).to_s(:db), :begin_time => Time.parse("9:00pm"), :end_time => Time.parse("12:00am"), 
          :website_url => "http://bigeasylounge.webs.com/", :price => 5.00, :admission_type => "cover", :private_event => false, :published => true, 
          :pub_date => (Time.new(2011,5,20) - 1.week).to_s(:db), :notes => "", 
          :address => {:first_line => "9820 Liberty Rd.", :second_line => "", :city => "Randallstown", :state => "MD", :country => "United States"}},
        ]


# Save all Events (skipping validation)
EVENTS.reverse.each do |event_details|  
  Event.new(event_details).save(:validate => false)
end

puts "Seeded #{Event.count} event(s) into the database."