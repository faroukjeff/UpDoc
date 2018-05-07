require 'rails_helper'

RSpec.describe SignupController, type: :controller do


  describe "patient account creation" do
    it "fails to confirm password" do
      post :add, {:session => {:username => "New@bun.com", :first_name => "New", :last_name_string => "User", :address => "11 Eleven St", :pnumber => "D12", :Healthcare => "waypoint", :password => "pass", :confirmPassword => "pass2"} }
      expect(response).to redirect_to(signup_signup_path)
    end
    it "receives incomplete fields" do
      post :add, {:session => {:username => "", :first_name => "New", :last_name_string => "User", :address => "11 Eleven St", :pnumber => "D12", :Healthcare => "waypoint", :password => "pass", :confirmPassword => "pass2"} }
      expect(response).to redirect_to(signup_signup_path)
    end
    it "is successful" do
      post :add, {:session => {:username => "New@bun.com", :first_name => "New", :last_name_string => "User", :address => "11 Eleven St", :pnumber => "D12", :Healthcare => "waypoint", :password => "pass", :confirmPassword => "pass"} }
      expect(response).to redirect_to(login_path)
      expect(Profile.find_by(username: "New@bun.com").first_name). to match("New")
      #expect(Credential.find_by(username: "New"))
    end
  end

end