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
    
    context "is successful" do
      let(:appointment1) {Appointment.new(did: 'Aditya@bin.com', slot: '9:00', pid: "Jeff@bin.com", av: 'F')}
      it "Adds new appt" do
        post :confirm ,  {:session => {:docid => 'Aditya@bin.com', :slot => '9:00', :pname => "Jeff@bin.com"} }
        allow(Appointment).to receive(:where).with(did: 'Aditya@bin.com', slot: '9:00', pid: "Jeff@bin.com", av: 'F').and_return(:appts =>[appointment1])
        expect(assigns(:av)).to eq(appointment1["av"])
      end
      it "redirects to login page" do
        expect(response).to have_http_status(:success)
      end
      
      it "is unsuccessful" do
        post :confirm, {:session => {:docid => 'Aditya@bin.com', :slot => '10:00', :pname => "Jeff@bin.com"} }
        expect(response).to redirect_to(login_path)
      end
    end
  end
  
end
