require 'rails_helper'

RSpec.describe DocapptController, type: :controller do

  describe "create appointment slot for a doctor" do
    it "is successful" do
      post :add, {:session => {:docid => 'Aditya@bin.com', :slot => '10:00'} }
      
      expect(response).to redirect_to(admin_admin_path)
      expect(Appointment.all[2].pid).to eq(nil)
      expect(Appointment.all[2].did).to eq("Aditya@bin.com")
      expect(Appointment.all[2].slot).to eq("10:00")
      expect(Appointment.all[2].av).to eq("A")
      expect(flash[:notice]).to have_content("Doctor Added To Appointment Table")
    end
    it "has invalid field" do
      post :add, {:session => {:docid => "John@doctors.com", :slot => nil} }  
      expect(response).to redirect_to(admin_admin_path)
      expect(flash[:notice]).to have_content("Doctor Does not exist")
    end
  end

end
