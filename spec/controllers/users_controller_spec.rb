require 'rails_helper'

RSpec.describe UsersController, type: :controller do
    let!(:user) { User.create!(username: "bob", email: "bob@bob.com", password: "123456") }

   describe "GET #show" do
     it "responds with status code 200" do
       get :show, {params: {id: 1}}
       expect(response).to have_http_status 200
     end

     it "renders the :show template" do
       get :show, {params: {id: 1}}
       expect(response).to render_template(:show)
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

     # {params:  {session: {email: "bob@bob.com", password: "123456"}}}

end
