require 'spec_helper'

describe Question do
  before(:each) do
    puts "asfs"
    DatabaseCleaner.clean_with(:truncation)

    @u = User.create(username: 'ryan')
    
    @q = Question.create(title: "test question?")
    @q.user = @u

    @u1 = User.create(username: "thomas")
    @u2 = User.create(username: "matt")

  end

  it "properly calculates votes" do
    @q.vote(@u1)
    @q.vote(@u2)

    # u1, u2 vote on question

    @q.score.should == 2

  end

  it "has a score of 0 with no votes" do
    @q.score.should == 0
  end

  it "should only allow users to vote once" do
    @q.vote(@u1)
    @q.vote(@u1).should be_false

    @q.score.should == 1
  end





end
