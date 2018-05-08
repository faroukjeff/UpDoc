require 'rails_helper'

RSpec.describe AppointmentController, type: :controller do

  describe "show available appointments" do
    it "is successful" do
      get :appointment
      expect(assigns(:data).to_a).to match(Appointment.where(:av => 'A').to_a)
      expect(assigns(:data).to_a).to_not match(Appointment.where(:av => 'F').to_a)
    end
  end

  describe "create appointment" do
    it "is successful" do
      post :confirm, {:session => {:docid => 'Aditya@bin.com', :slot => '9:00', :pname => "Jeff@bin.com"} }
      expect(Appointment.all[0].av).to eq("F")
      expect(response).to redirect_to(login_path)
    end
    it "is unsuccessful" do
      post :confirm, {:session => {:docid => 'Aditya@bin.com', :slot => '10:00', :pname => "Jeff@bin.com"} }
      expect(response).to redirect_to(login_path)
      expect(flash[:notice]).to have_content("Invalid Doctor or Time Slot")
    end
  end

end
