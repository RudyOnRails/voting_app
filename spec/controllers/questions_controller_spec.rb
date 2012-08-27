require 'spec_helper'

describe QuestionsController do
  describe "#index" do
    it "assigns @questions" do
      question = FactoryGirl.create(:question)
      get :index
      expect(assigns(:questions)).to eq([question])
    end
    it "renders index template" do
      get :index
      response.should render_template("index")
      response.code.should eq("200")
    end
  end
  describe "#new" do
    it "renders new template" do
      get :new
      assert_response :success
    end
    it "creates new instance of Question class" do
      Question.new.should be_an_instance_of(Question)
    end
  end
  describe "#create" do
    it "takes in params and make new variable"
    it "saves new variable in database"
    it "redirects to index page"
  end
  describe "#show" do
    it "passes the :id to show"
    it "finds that object in the db using the :id"
    it "renders the show view"
  end
  describe "#edit" do
    it "finds the object and set it equal to a variable"
    it "renders the edit view"
  end
  describe "#update" do
    describe "valid params"
    describe "invalid params"
  end
  describe "#destroy" do
    it "takes in the :id, and destroy the question"
    it "redirects to questions index"
  end
end
