require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end
  
  describe "log in" do
    context "with nonexistent account" do
      it "flashes a message" do
        post :show, {:session => {:username => 'email@bin.com', :password => 'invalid'} }
        expect(flash[:notice]).to have_content("Wrong username/password")
      end
      it "redirects to login" do
        post :show, {:session => {:username => 'email@bin.com', :password => 'invalid'} }
        expect(response).to redirect_to(login_path)
      end
    end
  end

  describe "doctor log in" do
    it "goes through to profile" do
      @doctor = double(:[] => {"usertype" => "D"})
      allow(Credential).to receive(:where).with(:username => 'Aditya@bin.com', :password => 'Arsenal4').and_return(@doctor)
      post :show, {:session => {:username => 'Aditya@bin.com', :password => 'Arsenal4'} }
      expect(response).to redirect_to(profile_doctorprofile_path)
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
  

  describe "patient log in" do
    it "is successful" do
      @patientcredential = double(:[] => {"usertype" => "P"})
      @patient = double(:[] => Profile.new(:docid => "Aditya@bin.com"))
      allow(Credential).to receive(:where).with(:username => 'Jeff@bin.com', :password => 'Realmadrid1').and_return(@patientcredential)
      allow(Profile).to receive(:where).with(:username => 'Jeff@bin.com').and_return(@patient)
      allow(Profile).to receive(:where).with(:username => 'Aditya@bin.com')
      post :show, {:session => {:username => 'Jeff@bin.com', :password => 'Realmadrid1'} }
      expect(response).to have_http_status(:success)
    end
  end

end
