require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  let!(:user) { User.create!(username: "bob", email: "bob@bob.com", password: "123456") }

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
    it "responds with status code 302 for signing in user" do
      post :create, {params:  {session: {email: "bob@bob.com", password: "123456"}}}
      expect(response).to have_http_status 302
    end

    it "creates a new session for signing in user" do
      post :create, {params:  {session: {email: "bob@bob.com", password: "123456"}}}
      expect(session[:user_id]).to eq(user.id)
    end
  end

  describe "GET #destroy" do
   it "responds with status code 302" do
      get :destroy
      expect(response).to have_http_status 302
   end

    it "clears session for user_id" do
      get :destroy
      expect(session[:user_id]).to be nil
    end
  end
end
