require 'rails_helper'

RSpec.describe LinkdocController, type: :controller do


  describe "doctor patient link" do
    it "is unsuccessful" do
      post :link, {:session => {:docid => '', :patid => ''} }
      expect(response).to redirect_to(admin_linkdoc_path)
    end
    it "is successful" do
      Profile.create!(:username => "Aditya@bin.com", :first_name => "Adita", :last_name_string => "Dere", :address => "144 Edward Street, Binghamton NY", :pnumber => "D0445687", :password => "Arsenal4")
      Profile.create!(:username => "New@bun.com", :first_name => "New", :last_name_string => "Patient", :address => "7000 Thousand Street, Binghamton NY", :pnumber => "P0997457", :password => "New8")

      post :link, {:session => {:doc => 'Aditya@bin.com', :pat => "New@bun.com"} }
      expect(response).to redirect_to(admin_admin_path)
      expect(Profile.find_by(username: "New@bun.com").docid). to match("Aditya@bin.com")
    end
  end

end
