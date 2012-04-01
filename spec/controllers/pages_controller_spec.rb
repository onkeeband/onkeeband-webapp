require 'spec_helper'

describe PagesController do
  render_views
  
  before(:each) do
    @base_title = "On Kee Jazz Band &raquo; Boston | Washington D.C."
  end
  
  
  def do_get(page=nil)
    get page
  end

  describe "GET 'home'" do
    it "should be successful" do
      get 'home'
      response.should be_success
    end
    it "should have the right title" do
         get 'home'
         response.should have_selector("title") do |title|
           title.should contain("On Kee Jazz Band")
         end
    end
  end

  describe "GET 'history'" do
    it "should be successful" do
      get 'history'
      response.should be_success
    end
    it "should have the right title" do
         get 'history'
         response.should have_selector("title") do |title|
            title.should contain("History")
         end
        
    end
  end

  describe "GET 'profiles'" do
    it "should be successful" do
      get 'profiles'
      response.should be_success
    end
    it "should have the right title" do
         get 'profiles'
         response.should have_selector("title") do |title|
            title.should contain("Profiles")
         end
    end
  end
  
  describe "GET 'photos'" do
    it "should be successful" do
      get 'photos'
      response.should be_success
    end
    it "should have the right title" do
         get 'photos'
         response.should have_selector("title") do |title|
            title.should contain("Photos")
         end
    end
  end
  
  describe "GET 'contact'" do
    it "should be successful" do
      get 'contact'
      response.should be_success
    end
    it "should have the right title" do
         get 'contact'
         response.should have_selector("title") do |title|
            title.should contain("Contact")
         end
    end
  end

end
