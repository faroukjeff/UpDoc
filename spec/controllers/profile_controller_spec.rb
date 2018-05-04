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


end
