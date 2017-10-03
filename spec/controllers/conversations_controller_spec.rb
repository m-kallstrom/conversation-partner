require 'rails_helper'

RSpec.describe ConversationsController, type: :controller do
  let!(:conversation) { Conversation.create }

  describe "GET #history" do
    it "responds with status code 200" do
      get :history, {params: {id: "10"}}
      expect(response).to have_http_status 200
    end

    it "renders the :show template" do
      get :history
      expect(response).to render_template(:show)
    end
  end

  describe "GET #new" do
    it "responds with status code 200" do
      get :new
      expect(response).to have_http_status 200
    end

    it "renders the :new template" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do
    it "responds with status code 200" do
      post :create, {params:  {sentence: {content: "hi"}}}
      expect(response).to have_http_status 200
    end

    it "creates a new conversation in the database" do
      before_count = Conversation.count
      post :create, {params:  {sentence: {content: "hi"}}}
      expect(Conversation.count).not_to eq(before_count)
    end

    it "assigns the newly created conversation as @conversation" do
      post :create, {params:  {sentence: {content: "hi"}}}
      expect(assigns(:conversation)).to eq(Conversation.last)
    end
  end

  describe "GET #destroy" do
   it "responds with status code 302" do
      get :destroy
      expect(response).to have_http_status 302
   end

    it "clears session for conversation_id" do
      get :destroy
      expect(session[:conversation_id]).to be nil
    end
  end
end
