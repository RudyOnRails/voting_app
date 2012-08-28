require 'spec_helper'

# You should test for things such as:

# was the web request successful?
# was the user redirected to the right page?
# was the user successfully authenticated?
# was the correct object stored in the response template?
# was the appropriate message displayed to the user in the view?

# test for json vs html (Ryan suggested, but I'm not sure where to start, will goog)

describe QuestionsController do
  describe "GET #index" do
    it "populates an array of questions" do
      question = FactoryGirl.create(:question)
      get :index
      expect(assigns(:questions)).to eq([question])
    end
    it "renders the :index view" do
      get :index
      response.should render_template("index")
    end
  end

  describe "GET #show" do
    it "assigns the requested question to @question" do
      question = FactoryGirl.create(:question)
      get :show, :id => question
      assigns(:question).should eq(question)
    end
    it "renders the #show view" do
      get :show, :id => FactoryGirl.create(:question)
      response.should render_template :show
    end
  end

  describe "GET #new" do
    it "renders new template" do
      get :new
      assert_response :success
    end
    it "creates new instance of Question class" do
      Question.new.should be_an_instance_of(Question)
    end
  end

  describe "POST #create" do

    context "with valid attributes" do

      it "creates a new question" do
        expect{
          post :create, question: FactoryGirl.attributes_for(:question)
        }.to change(Question, :count).by(1)
      end

      it "redirects to the new question" do
        post :create, question: FactoryGirl.attributes_for(:question)
        response.should redirect_to Question.last
      end

    end

    context "with invalid attributes" do

      it "does not save the new question" do
        expect{
          post :create, question: FactoryGirl.attributes_for(:question_invalid)
        }.to_not change(Question, :count)
      end

      it "re-renders the new method" do
        post :create, question: FactoryGirl.attributes_for(:question_invalid)
        response.should render_template :new
      end

    end
  end

  describe "GET #edit" do

    before :each do
      @question = FactoryGirl.create(:question)
    end

    it "finds the object and set it equal to a variable" do
      get :edit, :id => @question, :question => FactoryGirl.attributes_for(:question)
      assigns(:question).should eq(@question)
    end

    it "renders the edit view" do
      get :edit, :id => FactoryGirl.create(:question)
      response.should render_template :edit
    end
  end

  describe "PUT #update" do

    before :each do
      @question = FactoryGirl.create(:question, title: "What the fuck?")
    end

    context "valid params" do

      it "locate the requested @question" do
        put :update, :id => @question, :question => FactoryGirl.attributes_for(:question)
        assigns(:question).should eq(@question)
      end

      it "changes @question's attributes" do
        put :update, id: @question, question: FactoryGirl.attributes_for(:question, title: "What the FUCK?")
        @question.reload
        @question.title.should eq("What the FUCK?")
      end

      it "redirects to the upudated question" do
        put :update, id: @question, question: FactoryGirl.attributes_for(:question)
        response.should redirect_to @question
      end

    end

    context "invalid params" do

      it "locate the requested @question" do
        put :update, id: @question, question: FactoryGirl.attributes_for(:question_invalid)
        assigns(:question).should eq(@question)
      end
    
      it "does not change @question's attributes" do
          put :update, id: @question, question: FactoryGirl.attributes_for(:question, title: "")
          @question.reload
          @question.title.should_not eq("")
          @question.title.should eq("What the fuck?")
      end
    
      it "re-renders the edit method" do
        put :update, id: @question, question: FactoryGirl.attributes_for(:question_invalid)
        response.should render_template :edit
      end
    end

  end

  describe "DELETE #destroy" do

    before :each do
      @question = FactoryGirl.create(:question)
    end

    it "takes in the :id, and destroy the question" do
      expect{
        delete :destroy, id: @question
        }.to change(Question, :count).by(-1)
    end

    it "redirects to questions#index" do
      delete :destroy, id: @question
      response.should redirect_to questions_url
    end
  end

end
