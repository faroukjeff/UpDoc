require 'rails_helper'

RSpec.describe LinkdocController, type: :controller do


  describe "doctor patient link" do
    it "is unsuccessful" do
      post :link, {:session => {:docid => '', :patid => ''} }
      expect(response).to redirect_to(admin_linkdoc_path)
    end
    it "is successful" do
      post :link, {:session => {:doc => 'Aditya@bin.com', :pat => "John@bon.com"} }
      expect(response).to redirect_to(admin_admin_path)
      expect(Profile.find_by(username: "John@bon.com").docid). to match("Aditya@bin.com")
    end
  end

end
