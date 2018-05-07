require 'rails_helper'

RSpec.describe ResetController, type: :controller do

  describe "clear appointments" do
    it "is confirmed and successful" do
      @a = Appointment.create!({:pid=>nil, :did=>"Aditya@bin.com", :slot=>"9:00", :av=>"A"})
      @n1 = Appointment.create!({:pid=>"Sue@oracle.com", :did=>"Aditya@bin.com", :slot=>"9:45", :av=>"F"})
      @n2 = Appointment.create!({:pid=>"Jeff@bin.com", :did=>"Aditya@bin.com", :slot=>"10:00", :av=>"F"})
      post :reset, {:session => {:ver => "Y"} }
      
      expect(response).to redirect_to(admin_admin_path)
      
      #check that n1 and n2 were changed to available
      expect(Appointment.all[1].slot).to eq("9:45")
      expect(Appointment.all[1].av).to eq("A")
      expect(Appointment.all[1].pid).to eq(nil)
      expect(Appointment.all[1].did).to eq("Aditya@bin.com")
      expect(Appointment.all[2].slot).to eq("10:00")
      expect(Appointment.all[2].av).to eq("A")
      expect(Appointment.all[2].pid).to eq(nil)
      expect(Appointment.all[2].did).to eq("Aditya@bin.com")
      
      expect(flash[:notice]).to have_content("Reset Done!")
    end
    it "is cancelled" do
      @n0 = Appointment.create!({:pid=>"Sue@oracle.com", :did=>"Aditya@bin.com", :slot=>"9:45", :av=>"F"})
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