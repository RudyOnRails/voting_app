require 'spec_helper'

describe "Question Model" do
  before(:each) do
    DatabaseCleaner.clean_with(:truncation)
    @u = User.create(username: 'ryan')
    @q = Question.create(title: "test question?")
    @q.user = @u
    @u1 = User.create(username: "thomas")
    @u2 = User.create(username: "matt")
  end
  it "has a valid factory" do
    FactoryGirl.create(:question).should be_valid
  end
  it "properly calculates votes" do
    @q.vote(@u1)
    @q.vote(@u2)
    @q.score.should == 2
  end
  it "has a score of 0 with no votes" do
    @q.score.should == 0
  end
  it "allows users to vote once" do
    @q.vote(@u1)
    @q.vote(@u1).should be_false
    @q.score.should == 1
  end
  it "is invalid without a title" do
    FactoryGirl.build(:question, :title => nil).should_not be_valid
  end
  it "is invalid if title is not unique" do
    FactoryGirl.create(:question, :title => "Why is the sky blue?").should be_valid
    -> { FactoryGirl.create(:question, :title => "Why is the sky blue?") }.should raise_error(ActiveRecord::RecordInvalid)
  end
end
