require 'rails_helper'

RSpec.describe LinkdocController, type: :controller do


  describe "doctor patient link" do
    it "cannot find patient" do
        post :link, {:session => {:docid => '', :patid => ''} }
        expect(response).to redirect_to(admin_linkdoc_path)
    end
    it "successfully performs link" do
      @patient = double(:nil? => false)
      allow(Profile).to receive(:find_by).with(username: "John@bon.com").and_return(@patient)
      expect(@patient).to receive(:update).with(docid: "Aditya@bin.com")
      post :link, {:session => {:doc => 'Aditya@bin.com', :pat => "John@bon.com"} }
      #expect(response).to redirect_to(admin_admin_path)
    end
  end
end
