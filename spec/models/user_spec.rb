require 'spec_helper'

describe "User Model" do

  it "can be instantiated" do
    User.new.should be_an_instance_of(User)
  end

  it "has a valid factory" do
    FactoryGirl.create(:user).should be_valid
  end


end
