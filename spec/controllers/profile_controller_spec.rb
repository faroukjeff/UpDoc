require 'rails_helper'

RSpec.describe ProfileController, type: :controller do

  describe "get patient's medical history" do
    before :each do
      @medrecord = double(:medhistory=>"High Blood Pressure,Diabetes,Diarrhea,Back Pain,Kidney Stones", :meddata=>"0,1,1,0,1")
      @medrecordCollection = double(:[] => @medrecord)
    end
    it "and store it" do
      allow(MedicalRecord).to receive(:where).with(pnumber: "P0342567").and_return(@medrecordCollection)
      get :medicalrecords, {:pnumber=>"P0342567"}
      expect(assigns(:meddata))
    end
    it "and obtain the list of conditions" do
      allow(MedicalRecord).to receive(:where).with(pnumber: "P0342567").and_return(@medrecordCollection)
      expect(@medrecord).to receive(:medhistory)
      get :medicalrecords, {:pnumber=>"P0342567"}
    end
    it "and obtain the value of each condition" do
      allow(MedicalRecord).to receive(:where).with(pnumber: "P0342567").and_return(@medrecordCollection)
      expect(@medrecord).to receive(:meddata)
      get :medicalrecords, {:pnumber=>"P0342567"}
    end
  end
  
  describe "doctor profile" do
    it "can access the doctor's profile" do
      allow(Profile).to receive(:where).with(username: "Aditya@bin.com")
      allow(Profile).to receive(:where).with(docid: "Aditya@bin.com")
      post :doctorprofile, { :params1 => "Aditya@bin.com" }
      expect(assigns(:user))
    end
    it "can access his patients' profiles" do
      allow(Profile).to receive(:where).with(username: "Aditya@bin.com")
      allow(Profile).to receive(:where).with(docid: "Aditya@bin.com")
      post :doctorprofile, { :params1 => "Aditya@bin.com" }
      expect(assigns(:data))
    end
  end

  describe "search for patient" do
    it "is successful" do
      allow(Profile).to receive(:where).with(:username => "Aditya@bin.com")
      expect(Profile).to receive(:where).with(:docid => "Aditya@bin.com", :first_name => "Jeff", :last_name_string => "Baker")
      get :searchpatients, {:data1 => {:pname => "Jeff Baker"}, :docid => "Aditya@bin.com" }
    end
    it "succeeds using only first name" do
      allow(Profile).to receive(:where).with(:username => "Aditya@bin.com")
      expect(Profile).to receive(:where).with(:docid => "Aditya@bin.com", :first_name => "Jeff")
      get :searchpatients, {:data1 => {:pname => "Jeff"}, :docid => "Aditya@bin.com" }
    end
    it "notifies that patient does not exist" do
      allow(Profile).to receive(:where).with(:username => "Aditya@bin.com")
      allow(Profile).to receive(:where).with(:docid => "Aditya@bin.com", :first_name => "Dalai", :last_name_string => "Lama").and_return(nil)
      get :searchpatients, {:data1 => {:pname => "Dalai Lama"}, :docid => "Aditya@bin.com" }
      expect(flash[:notice1]).to have_content("Patient not found")
    end
  end
  
  describe "view appointments" do
    it "retains doctor identification" do
      allow(Appointment).to receive(:where).with(:did => "Aditya@bin.com")
      expect(Profile).to receive(:where).with(:username => "Aditya@bin.com")
      get :myappt, {:docid => "Aditya@bin.com"}
    end
    it "obtains this doctor's appointments" do
      allow(Profile).to receive(:where).with(:username => "Aditya@bin.com")
      expect(Appointment).to receive(:where).with(:did => "Aditya@bin.com")
      get :myappt, {:docid => "Aditya@bin.com"}
    end
  end

end
