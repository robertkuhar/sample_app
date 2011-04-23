require 'spec_helper'

describe PagesController do
  integrate_views

  before(:each) do
    @base_title = 'Ruby on Rails Tutorial Sample App |'
  end

  describe "GET 'home'" do
    page = 'home'
    it "should be successful" do
      get page
      response.should be_success
    end
    it "should have correct title" do
      get page
      response.should have_tag('title', "#{@base_title} #{page.capitalize}")
    end
  end

  describe "GET 'contact'" do
    page = 'contact'
    it "should be successful" do
      get page
      response.should be_success
    end
    it "should have correct title" do
      get page
      response.should have_tag('title', "#{@base_title} #{page.capitalize}")
    end
  end

  describe "GET 'about'" do
    page = 'about'
    it "should be successful" do
      get page
      response.should be_success
    end
    it "should have correct title" do
      get page
      response.should have_tag('title', "#{@base_title} #{page.capitalize}")
    end
  end

  describe "GET 'about'" do
    page = 'help'
    it "should be successful" do
      get page
      response.should be_success
    end
    it "should have correct title" do
      get page
      response.should have_tag('title', "#{@base_title} #{page.capitalize}")
    end
  end

end
