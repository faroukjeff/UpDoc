require 'rails_helper'

RSpec.describe DocapptController, type: :controller do

  describe "create appointment slot for a doctor" do
    context "is successful" do
      let(:appointment1) {Appointment.new(did: 'Aditya@bin.com', slot: '10:00', pid: nil, av: 'A')}
      it "redirects to admin_admin_path" do
        post :add, {:session => {:docid => 'Aditya@bin.com', :slot => '10:00'} }
        expect(response).to  redirect_to(admin_admin_path)
      end
      it "adds doctor to appt table" do
        post :add, {:session => {:docid => 'Aditya@bin.com', :slot => '10:00'} }
        allow(Appointment).to receive(:where).with(did: 'Aditya@bin.com', slot: '10:00', pid: nil, av: 'A').and_return(:appts =>[appointment1])
        expect(assigns(:dmail)).to eq(appointment1["did"])
    end
      
    end
    it "has invalid field" do
      post :add, {:session => {:docid => "John@doctors.com", :slot => nil} }  
      expect(response).to redirect_to(admin_admin_path)
    end
  end

end
