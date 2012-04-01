class Event
  include Mongoid::Document
  include Mongoid::MultiParameterAttributes
  include Mongoid::Timestamps::Created
  
  field :venue_name,      :type => String
  field :date,            :type => Date
  field :begin_time,      :type => Time
  field :end_time,        :type => Time
  field :website_url,     :type => String
  field :price,           :type => Float, :default => 0.00
  field :admission_type,  :type => String
  field :notes,           :type => String
  field :private_event,   :type => Boolean, :default => false
  field :published,       :type => Boolean, :default => false
  
  embeds_one :address
  
  accepts_nested_attributes_for :address
  
  delegate :first_line, :second_line, :city, :state, :country, :to => :address
  
  ADMISSION_TYPES = {"Ticket Event" => :ticket, "Cover Charge" => :cover}
  WEB_URL_REGEX = /^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/ix
  PRICE_REGEX = /^\d+??(?:\.\d{0,2})?$/
  
  validates_presence_of :venue_name, :date, :message => "can't be blank"
  validates :date, :uniqueness => { :message => "please select another date" }
  
  with_options :unless => :is_private? do |event|
    event.validates :begin_time, :presence => true
    event.validates :end_time, :presence => true
    event.validate :begin_time_before_end_time, :unless => "begin_time.blank? || end_time.blank?"
  end
  
  validates :website_url, :format => {:with => WEB_URL_REGEX, :message => "check the URL, should start with http:// or https:// "}, :allow_blank => true
  validates :price, :format => {:with => PRICE_REGEX, :message => "must be a valid dollar amount."}, :allow_blank => true
  validate :event_date_not_in_past, :unless => "date.blank?"
  
  def is_private?
    self.private_event
  end
  
  private
    
  def event_date_not_in_past
    errors.add(:date, "can't be in the past") if self.date < Date.yesterday
  end
  
  def begin_time_before_end_time
    unless self.begin_time < self.end_time
      errors.add(:begin_time, "can't be after event's End Time")
      errors.add(:end_time, "can't be before event's Begin Time")
    end
  end
end
