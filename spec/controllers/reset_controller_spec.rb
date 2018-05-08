require 'rails_helper'

RSpec.describe ResetController, type: :controller do

  describe "clear appointments" do
    it "is confirmed and successful" do
      post :reset, {:session => {:ver => "Y"} }
      
      expect(response).to redirect_to(admin_admin_path)
      
      #check that the filled appointment is reset
      expect(Appointment.all[0].slot).to eq("9:45")
      expect(Appointment.all[0].av).to eq("A")
      expect(Appointment.all[0].pid).to eq(nil)
      expect(Appointment.all[0].did).to eq("Aditya@bin.com")
      
      expect(flash[:notice]).to have_content("Reset Done!")
    end
    it "is cancelled" do
      post :reset, {:session => {:ver => "n"} }
      expect(response).to redirect_to(admin_admin_path)
      #check that appointment is still intact
      expect(Appointment.all[0].slot).to eq("9:45")
      expect(Appointment.all[0].av).to eq("F")
      expect(Appointment.all[0].pid).to eq("Sue@oracle.com")
      expect(Appointment.all[0].did).to eq("Aditya@bin.com")
      
      expect(flash[:notice]).to have_content("Reset Aborted!")
    end
  end

end