require 'rails_helper'

RSpec.describe ProfileController, type: :controller do

  describe "view patient's medical history" do
    it "is successful" do
      post :medicalrecords, {:pnumber => "P0342567"}
      expect(assigns(:meddata))
      expect(assigns(:medrdata))
      expect(assigns(:medcheckbox))
    end
  end
  
  describe "doctor profile" do
    it "creates necessary variables" do
      post :doctorprofile, { :params1 => "Aditya@bin.com" }
      expect(assigns(:data).to_a).to eq(Profile.where(:docid => "Aditya@bin.com").to_a)
      expect(assigns(:user).to_a).to eq(Profile.where(:username => "Aditya@bin.com").to_a)
    end
    #it "permits" do
    #  Profile.should_receive(:session).with(:username)
    #end
  end

  describe "search for patient" do
    it "is successful" do
      get :searchpatients, {:data1 => {:pname => "Jeff Baker"}, :docid => "Aditya@bin.com" }
      response.should be_ok
      expect(assigns(:data).to_a).to match(Profile.where(:first_name => "Jeff", :last_name_string => "Baker", :docid => "Aditya@bin.com").to_a)
      expect(assigns(:user).to_a).to match(Profile.where(:username => "Aditya@bin.com").to_a)
    end
    it "uses only first name" do
      get :searchpatients, {:data1 => {:pname => "Jeff"}, :docid => "Aditya@bin.com" }
      response.should be_ok
      expect(assigns(:data).to_a).to match(Profile.where(:first_name => "Jeff", :last_name_string => "Baker", :docid => "Aditya@bin.com").to_a)
      expect(assigns(:user).to_a).to match(Profile.where(:username => "Aditya@bin.com").to_a)
    end
    it "is unsuccessful" do
      get :searchpatients, {:data1 => {:pname => "Dalai Lama"}, :docid => "Aditya@bin.com" }
      response.should be_ok
      expect(assigns(:data)).to eq([])
    end
  end
  
  describe "view appointments" do
    it "for doctor" do
      get :myappt, {:docid => "Aditya@bin.com"}
      expect(assigns(:data).to_a).to match(Appointment.where(:did => "Aditya@bin.com").to_a)
      expect(assigns(:user).to_a).to match(Profile.where(:username => "Aditya@bin.com").to_a)
    end
  end

end
