require 'spec_helper'

describe Micropost do
  before(:each) do
    @user = Factory(:user)
    @attr = { :content => 'value for content' }
  end

  it "should create a new instance given valid attributes" do
    micropost = @user.microposts.create!(@attr)
    micropost.content.should =~ /value for content/
    assert_equal(@user, micropost.user)
  end

  describe "user associations" do
    before(:each) do
      @micropost = @user.microposts.create(@attr)
    end

    it "should have a user attribute" do
      @micropost.should respond_to(:user)
    end

    it "should have the right associated user" do
      @micropost.user_id.should == @user.id
      @micropost.user.should == @user
    end
  end

end
