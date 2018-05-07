require 'rails_helper'

RSpec.describe DocapptController, type: :controller do

  describe "create appointment slot for a doctor" do
    it "is successful" do
      @d = Credential.create!({:username=> 'Aditya@bin.com', :password=> 'Arsenal4', :usertype=> 'D'})
      post :add, {:session => {:docid => 'Aditya@bin.com', :slot => '9:00'} }
      @a = Appointment.new({:pid=>nil, :did=>"Aditya@bin.com", :slot=>"9:00", :av=>"A"})
      
      expect(response).to redirect_to(admin_admin_path)
      expect(Appointment.all[0].pid).to eq(nil)
      expect(Appointment.all[0].did).to eq("Aditya@bin.com")
      expect(Appointment.all[0].slot).to eq("9:00")
      expect(Appointment.all[0].av).to eq("A")
      expect(flash[:notice]).to have_content("Doctor Added To Appointment Table")
    end
    it "has invalid field" do
      Credential.create!({:username=> 'Aditya@bin.com', :password=> 'Arsenal4', :usertype=> 'D'})
      post :add, {:session => {:docid => "John@doctors.com", :slot => nil} }  
      expect(response).to redirect_to(admin_admin_path)
      expect(flash[:notice]).to have_content("Doctor Does not exist")
    end
  end

end
