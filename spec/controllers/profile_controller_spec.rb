require 'rails_helper'

RSpec.describe ProfileController, type: :controller do

  describe "view patient's medical history" do
    it "is successful" do
      @testrecord = MedicalRecord.create!({:pnumber=>"P0342567",:name=>"Jeff Baker",:address=>"198 Main Street, Binghamton NY",:healthcare=>"Geo Blue",:medhistory=>"High Blood Pressure,Diabetes,Diarrhea,Back Pain,Kidney Stones" ,:meddata=>"0,1,1,0,1"})
      #@patient = 
      post :medicalrecords, {:pnumber => "P0342567"}
      #expect(response).to redirect_to(profile_medicalrecords_path(:pnumber => "P0342567"))
      expect(assigns(:meddata))
      expect(assigns(:medrdata))
      expect(assigns(:medcheckbox))
    end
  end

  describe "search for patient" do
    it "is successful" do
      @d = Profile.create!({:username=> "Aditya@bin.com",:first_name=>"Aditya",:last_name_string=>"Dere",:address=>"144 Edward Street, Binghamton NY",:pnumber=>"D0445687",:password=>"Arsenal4"})
      @p = Profile.create!({:username=> "Jeff@bin.com",:first_name=>"Jeff",:last_name_string=>"Baker",:address=>"198 Main Street, Binghamton NY",:pnumber=>"P0342567",:Healthcare=>"Geo Blue",:password=>"Realmadrid1",:docid=>"Aditya@bin.com"})
      
      get :searchpatients, {:data1 => {:pname => "Jeff Baker"}, :docid => "Aditya@bin.com" }
      response.should be_ok
      expect(assigns(:data)).to include(@p)
      expect(assigns(:user)).to include(@d)
    end
  end
    it "is unsuccessful" do
      Profile.create!({:username=> "Aditya@bin.com",:first_name=>"Aditya",:last_name_string=>"Dere",:address=>"144 Edward Street, Binghamton NY",:pnumber=>"D0445687",:password=>"Arsenal4"})
      Profile.create!({:username=> "Jeff@bin.com",:first_name=>"Jeff",:last_name_string=>"Baker",:address=>"198 Main Street, Binghamton NY",:pnumber=>"P0342567",:Healthcare=>"Geo Blue",:password=>"Realmadrid1",:docid=>"Aditya@bin.com"})

      get :searchpatients, {:data1 => {:pname => "Dalai Lama"}, :docid => "Aditya@bin.com" }
      response.should be_ok
      expect(assigns(:data)).to eq([])
  end
  
  describe "view appointments" do
    it "for doctor" do
      @u = Profile.create!({:username=> "Aditya@bin.com",:first_name=>"Aditya",:last_name_string=>"Dere",:address=>"144 Edward Street, Binghamton NY",:pnumber=>"D0445687",:password=>"Arsenal4"})
      @a = Appointment.create!({:pid=>nil, :did=>"Aditya@bin.com", :slot=>"9:00", :av=>"A"})
      get :myappt, {:docid => "Aditya@bin.com"}
      expect(assigns(:data)).to include(@a)
      expect(assigns(:user)).to include(@u)
    end
  end

end
