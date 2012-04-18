FactoryGirl.define do 
  factory :valid_address, :class => Address do 
    first_line'123 Anystreet St.'
    city 'Anytown'
    state 'MD'
    country 'United States'
  end

  factory :valid_event, :class => Event do 
    venue_name 'Place B'
    # e.date Time.parse("January 25th, 2011, 1:00pm").to_s(:db)
    date Time.now.to_s(:db)
    begin_time Time.parse("1:00pm")
    end_time Time.parse("5:00pm")
    website_url 'http://www.theplacea.com'
    price 10.00
    admission_type 'Ticket Event'
    private_event false
    notes 'This is a Jazz Concert Series'
    address {FactoryGirl.build(:valid_address)}
  end
end


# Factory.define :valid_address, :class => Address do |addr|
#   addr.first_line'123 Anystreet St.'
#   addr.city 'Anytown'
#   addr.state 'MD'
#   addr.country 'United States'
# end
# 
# Factory.define :valid_event, :class => Event do |e|
#   e.venue_name 'Place B'
#   # e.date Time.parse("January 25th, 2011, 1:00pm").to_s(:db)
#   e.date Time.now.to_s(:db)
#   e.begin_time Time.parse("1:00pm")
#   e.end_time Time.parse("5:00pm")
#   e.website_url 'http://www.theplacea.com'
#   e.price 10.00
#   e.admission_type 'Ticket Event'
#   e.private_event false
#   e.notes 'This is a Jazz Concert Series'
#   e.address {Factory.build(:valid_address)}
# end

