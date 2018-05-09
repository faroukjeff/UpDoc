require 'rails_helper'

RSpec.describe LinkdocController, type: :controller do


  describe "doctor patient link" do
    context "is unsuccessful" do
      let(:patient1) {Profile.new(username: "Jeff@bin.com",first_name: "Jeff",last_name_string: "Baker",address: "198 Main Street, Binghamton NY",pnumber: "P0342567", Healthcare: "Geo Blue",password: "Realmadrid1",docid: "Aditya@bin.com")}
      it "does not link doctor with patient" do
        post :link, {:session => {:docid => '', :patid => ''} }
        expect(response).to redirect_to(admin_linkdoc_path)
      end
    it "is successful" do
      post :link, {:session => {:doc => 'Aditya@bin.com', :pat => "John@bon.com"} }
      allow(Profile).to receive(:where).with(username: "Jeff@bin.com",first_name: "Jeff",last_name_string: "Baker",address: "198 Main Street, Binghamton NY",pnumber: "P0342567", Healthcare: "Geo Blue",password: "Realmadrid1",docid: "Aditya@bin.com").and_return(:appts =>[patient1])
      #expect(response).to redirect_to(admin_admin_path)
      expect(assigns(:doc)).to eq(patient1["docid"])
    end
  end
  end
end
