FactoryGirl.define do
  factory :admin, :class => User do
    name 'Antwan Foster'
    email 'user1@example1.com'
    password 'please'
  end
end

# Factory.define :admin, :class => User do |u|
#   u.name 'Antwan Foster'
#   u.email 'user1@example1.com'
#   u.password 'please'
# end

