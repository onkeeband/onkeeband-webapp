class PagesController < ApplicationController
  
  # Cache All Static Pages
  %w(home history profiles contact aubrey david lenny sonny steve rhube carl darren greg rasheed).each do |page|
    caches_page page.to_sym
  end
  
  
  def home
  end
  
  def history
    @title = "History"
  end
  
  def profiles
    @title = "Profiles"
  end
  
  def photos
    @title = "Photos"
  end
  
  def contact
     @title = "Contact Us"
  end
  
end
