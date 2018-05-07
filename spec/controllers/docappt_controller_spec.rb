require 'rails_helper'

RSpec.describe DocapptController, type: :controller do

  describe "create appointment slot for a doctor" do
    it "is successful" do
      @d = Credential.create!({:username=> 'Aditya@bin.com', :password=> 'Arsenal4', :usertype=> 'D'})
      post :add, {:session => {:docid => 'Aditya@bin.com', :slot => '9:00'} }
      @a = Appointment.create!({:pid=>nil, :did=>"Aditya@bin.com", :slot=>"9:00", :av=>"A"})
      
      expect(response).to redirect_to(admin_admin_path)
      expect(Appointment.all).to include(@a)
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
