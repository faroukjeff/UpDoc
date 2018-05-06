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
      @cred = {:username => 'Aditya@bin.com', :password => 'Arsenal4', :usertype => "D"}
      Credential.create!(@cred)
      post :show, {:session => @cred }
      #expect(page.body).to match("Your Profile")
      expect(response).to redirect_to(profile_doctorprofile_path(:params1 => 'Aditya@bin.com'))
    end
  end
  
  describe "admin log in" do
    it "is unsuccessful" do
      post :show, {:session => {:username => 'admin003@updoc.com', :password => 'wrong'} }
      expect(response).to redirect_to('/login')
    end
    it "is successful" do
      post :show, {:session => {:username => 'admin003@updoc.com', :password => 'admintest7'} }
      expect(response).to redirect_to(admin_admin_path)
    end
  end

end
