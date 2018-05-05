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
      Profile.create!({:username=> "Aditya@bin.com",:first_name=>"Aditya",:last_name_string=>"Dere",:address=>"144 Edward Street, Binghamton NY",:pnumber=>"D0445687",:password=>"Arsenal4"})
      Profile.create!({:username=> "Jeff@bin.com",:first_name=>"Jeff",:last_name_string=>"Baker",:address=>"198 Main Street, Binghamton NY",:pnumber=>"P0342567",:Healthcare=>"Geo Blue",:password=>"Realmadrid1",:docid=>"Aditya@bin.com"})
      
      #Search patient: A form with two fields, first_name and last_name, that uses url: profile_searchpatients_path
      #So from the doctor profile page, with its list of patients, you can type in a first name and last name, press Search,
      #     and be brought to a results page located at profile_searchpatients_path
      post :searchpatients, {:first_name => "Jeff", :last_name => "Baker", :docid => "Aditya@bin.com" }
      expect(response).to redirect_to(profile_searchpatients_path(:first_name => "Jeff", :last_name => "Baker", :docid => "Aditya@bin.com"))
      #The controller method searchpatients searches the profiles table for a profile that has the first_name, last_name, and docid from params,
      #     and lists all matches.
      #Display the matches in a table similar to the one of all patients on the doctor's profile page.
      page.should have_content("Jeff Baker")
      page.should have_content("P0342567")
      page.should have_content("Geo Blue")
      page.should have_content("198 Main Street, Binghamton NY")
    end
  end
  it "is unsuccessful" do
      Profile.create!({:username=> "Aditya@bin.com",:first_name=>"Aditya",:last_name_string=>"Dere",:address=>"144 Edward Street, Binghamton NY",:pnumber=>"D0445687",:password=>"Arsenal4"})
      Profile.create!({:username=> "Jeff@bin.com",:first_name=>"Jeff",:last_name_string=>"Baker",:address=>"198 Main Street, Binghamton NY",:pnumber=>"P0342567",:Healthcare=>"Geo Blue",:password=>"Realmadrid1",:docid=>"Aditya@bin.com"})

      post :searchpatients, {:first_name => "Dalai", :last_name => "Lama", :docid => "Aditya@bin.com" }
      expect(response).to redirect_to(profile_searchpatients_path(:first_name => "Dalai", :last_name => "Lama", :docid => "Aditya@bin.com"))
      #The controller method searchpatients searches the profiles table for a profile that has the first_name, last_name, and docid from params,
      #     and lists all matches.
      #Display the matches in a table similar to the one of all patients on the doctor's profile page.
      page.should have_content("Patient not found")
  end

end
