require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "doctor log in" do
    it "is unsuccessful" do
      post :show, {:session => {:username => 'email@bin.com', :password => 'invalid'} }
      expect(response).to redirect_to('/login')
    end
    it "is successful" do
      post :show, {:session => {:username => 'Aditya@bin.com', :password => 'Arsenal4'} }
      expect(response).to redirect_to('/doctorprofile')
    end
  end

end
