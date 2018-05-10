require 'rails_helper'

RSpec.describe ResetController, type: :controller do

  describe "clear appointments" do
 
    context "is confirmed and" do
      let(:appointment1) {Appointment.new(pid: "Sue@oracle.com", did: "Aditya@bin.com", slot: "9:45", av: "F")}
      let(:appointment2) {Appointment.new(pid: nil, did: "Aditya@bin.com", slot: "9:45", av: "A")}
      it "updates the table" do
        expect(Appointment).to receive(:update_all).with(:pid=>nil, :av=>'A')
        post :reset, {:session => {ver: "Y"} }
      end
      it "reloads the page" do
        allow(Appointment).to receive(:update_all).with(:pid=>nil, :av=>'A') 
        post :reset, {:session => {ver: "Y"} }
        expect(response).to redirect_to admin_admin_path
      end
      it "flashes a confirmation" do
        allow(Appointment).to receive(:update_all).with(:pid=>nil, :av=>'A') 
        post :reset, {:session => {ver: "Y"} }
        expect(flash[:notice]).to have_content("Reset Done!")
      end
    end
    context "is aborted and" do
      it "reloads the page" do
        post :reset, {:session => {ver: "N"} }
        expect(response).to redirect_to admin_admin_path
      end
      it "flashes a notification" do
        post :reset, {:session => {:ver => "n"} }
        expect(flash[:notice]).to have_content("Reset Aborted!")
      end
    end
  end

end