require 'rails_helper'

RSpec.describe DocsignupController, type: :controller do


  describe "doctor account creation" do
    it "fails to confirm password" do
      post :add, {:session => {:username => "New@bun.com", :first_name => "New", :last_name_string => "User", :address => "11 Eleven St", :pnumber => "D12", :password => "pass", :confirmPassword => "pass2"} }
      expect(response).to redirect_to(admin_docsignup_path)
    end
    it "receives incomplete fields" do
      post :add, {:session => {:username => nil, :first_name => "New", :last_name_string => "User", :address => "11 Eleven St", :pnumber => "D12", :password => "pass", :confirmPassword => "pass2"} }
      expect(response).to redirect_to(admin_docsignup_path)
    end
    it "is successful" do
      post :add, {:session => {:username => "New@bun.com", :first_name => "New", :last_name_string => "User", :address => "11 Eleven St", :pnumber => "D12", :password => "pass", :confirmPassword => "pass"} }
      expect(response).to redirect_to(admin_admin_path)
      expect(Profile.find_by(username: "New@bun.com").first_name). to match("New")

    end
  end

end
