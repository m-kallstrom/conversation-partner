require 'rails_helper'

RSpec.describe ProjectController, type: :controller do

  describe "GET #about" do
    it "responds with status code 200" do
      get :about
      expect(response).to have_http_status 200
    end

    it "renders the :about template" do
      get :about
      expect(response).to render_template(:about)
    end
  end

    describe "GET #landing" do
    it "responds with status code 200" do
      get :landing
      expect(response).to have_http_status 200
    end

    it "renders the :landing template" do
      get :landing
      expect(response).to render_template(:landing)
    end
  end
end
