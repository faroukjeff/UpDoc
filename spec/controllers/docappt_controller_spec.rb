require 'rails_helper'

RSpec.describe DocapptController, type: :controller do

  describe "create appointment slot for a doctor" do
    #let(:credential) {Credential.new(username: "Aditya@bin.com", usertype: 'D')}
    before :each do
      @credential = double(:blank? => false)
    end
    it "adds a new time slot" do
      allow(Credential).to receive(:where).with(:username => "Aditya@bin.com", :usertype => "D").and_return(@credential)
      expect(Appointment).to receive(:create!).with(:pid=> nil, :did=> 'Aditya@bin.com', :slot=> '10:00', :av=> 'A')
      post :add, {:session => {:docid => 'Aditya@bin.com', :slot => '10:00'} }
    end
    it "flashes a confirmation" do
      allow(Credential).to receive(:where).with(:username => "Aditya@bin.com", :usertype => "D").and_return(@credential)
      post :add, {:session => {:docid => 'Aditya@bin.com', :slot => '10:00'} }
      expect(flash[:notice]).to have_content("Doctor Added To Appointment Table")
    end
    it "has invalid field" do
      post :add, {:session => {:docid => "John@doctors.com", :slot => nil} }  
      expect(response).to redirect_to(admin_admin_path)
    end
  end

end
