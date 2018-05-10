require 'rails_helper'

RSpec.describe AppointmentController, type: :controller do
  
  describe "show available appointments" do
    
    context "is successful" do
      let(:appointment1) {Appointment.new(av: 'A')}
      let(:appointment2) {Appointment.new(av: 'F')}
      it "finds available appt" do
        allow(Appointment).to receive(:where).with(av: 'A').and_return(:appts =>[appointment1])
        get :appointment
        expect(assigns(:data)).to eq(:appts =>[appointment1])
      end
      it "does not find unavailable appt" do
        allow(Appointment).to receive(:where).with(av: 'A').and_return(:appts =>[appointment1])
        get :appointment
        expect(assigns(:data)).to_not eq(:appts =>[appointment2])
      end
    
    end
  end

  describe "create appointment" do
    
    context "finds an open time slot and" do
      before :each do
        @emptyAppointment = double(:update => true)
      end
      #let(:appointment1) {Appointment.new(did: 'Aditya@bin.com', slot: '9:00', pid: nil, av: 'A')}
      
      it "makes the appointment" do
        allow(Appointment).to receive(:find_by).with(did: "Aditya@bin.com", slot: "9:00").and_return(@emptyAppointment)
        post :confirm ,  {:session => {:docid => 'Aditya@bin.com', :slot => '9:00', :pname => "Jeff@bin.com"} }
        expect(assigns(:appt))#.to receive(:update)#.with(pid: "Jeff@bin.com", av: 'F').and_return(true)
      end
      it "redirects to login page" do
        post :confirm ,  {:session => {:docid => 'Aditya@bin.com', :slot => '9:00', :pname => "Jeff@bin.com"} }
        expect(response).to redirect_to(login_path)
      end
      it "flashes a confirmation" do
        allow(Appointment).to receive(:find_by).with(did: "Aditya@bin.com", slot: "9:00").and_return(@emptyAppointment)
        post :confirm ,  {:session => {:docid => 'Aditya@bin.com', :slot => '9:00', :pname => "Jeff@bin.com"} }
        expect(flash[:notice]).to have_content("Appointment Confirmed")
      end
    end
      
    it "is unsuccessful" do
      allow(Appointment).to receive(:find_by).with(did: "Aditya@bin.com", slot: "10:00").and_return('')
      post :confirm, {:session => {:docid => 'Aditya@bin.com', :slot => '10:00', :pname => "Jeff@bin.com"} }
      expect(response).to redirect_to(login_path)
    end
  end
  
end
