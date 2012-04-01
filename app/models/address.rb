class Address
  include Mongoid::Document
  
  field :first_line,    :type => String
  field :second_line,   :type => String
  field :city,          :type => String
  field :state,         :type => String
  field :country,       :type => String
  
  embedded_in :event
  
  STATE_COUNTRIES = ["United States", "Canada"]
  
  validates_presence_of :city, :message => "can't be blank"
  validates :first_line, :presence => true, :unless => Proc.new {|addr| addr.event.is_private?}
  validates :state, :length => {:is => 2, :message => "must be two character abbreviation"}, :unless => Proc.new { |a| a.state.blank? && !STATE_COUNTRIES.include?(a.country) }
end
