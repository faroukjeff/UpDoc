require 'rails_helper'

RSpec.describe SignupController, type: :controller do


  describe "patient account creation" do
    context "fails to confirm password" do
      it "and redirects to sign up" do
        post :add, {:session => {:username => "New@bun.com", :first_name => "New", :last_name_string => "User", :address => "11 Eleven St", :Healthcare => "Geo Blue", :password => "pass", :confirmPassword => "pass2"} }
        expect(response).to redirect_to(signup_signup_path)
      end
      it "and notifies user" do
        post :add, {:session => {:username => "New@bun.com", :first_name => "New", :last_name_string => "User", :address => "11 Eleven St", :Healthcare => "Geo Blue", :password => "pass", :confirmPassword => "pass2"} }
        expect(flash[:notice]).to have_content("Passwords don't match")
      end
    end
    
    context "receives incomplete fields" do
      it "and redirects to sign up" do
        post :add, {:session => {:username => '', :first_name => "New", :last_name_string => "User", :address => "11 Eleven St", :Healthcare => "Geo Blue", :password => "pass", :confirmPassword => "pass"} }
        expect(response).to redirect_to(signup_signup_path)
      end
      it "and notifies user" do
        post :add, {:session => {:username => 'New@bon.com', :first_name => '', :last_name_string => "User", :address => "11 Eleven St", :Healthcare => "Geo Blue", :password => "pass", :confirmPassword => "pass"} }
        expect(flash[:notice]).to have_content("Fields cannot be null")
      end
    end
    
    context "is successful and" do
      it "creates a profile" do
        expect(Profile).to receive(:create!)
        allow(Credential).to receive(:create!).with(:username => "New@bun.com", :password => "pass", :usertype => "P")
        allow(MedicalRecord).to receive(:create!)
        post :add, {:session => {:username => "New@bun.com", :first_name => "New", :last_name_string => "User", :address => "11 Eleven St", :Healthcare => "Geo Blue", :password => "pass", :confirmPassword => "pass"} }
      end
      it "creates a credential" do
        allow(Profile).to receive(:create!)
        expect(Credential).to receive(:create!).with(:username => "New@bun.com", :password => "pass", :usertype => "P")
        allow(MedicalRecord).to receive(:create!)
        post :add, {:session => {:username => "New@bun.com", :first_name => "New", :last_name_string => "User", :address => "11 Eleven St", :Healthcare => "Geo Blue", :password => "pass", :confirmPassword => "pass"} }
      end
      it "creates a medical record" do
        allow(Profile).to receive(:create!)
        allow(Credential).to receive(:create!).with(:username => "New@bun.com", :password => "pass", :usertype => "P")
        expect(MedicalRecord).to receive(:create!)
        post :add, {:session => {:username => "New@bun.com", :first_name => "New", :last_name_string => "User", :address => "11 Eleven St", :Healthcare => "Geo Blue", :password => "pass", :confirmPassword => "pass"} }
      end
      it "redirects to login page" do
        allow(Profile).to receive(:create!)
        allow(Credential).to receive(:create!).with(:username => "New@bun.com", :password => "pass", :usertype => "P")
        allow(MedicalRecord).to receive(:create!)
        post :add, {:session => {:username => "New@bun.com", :first_name => "New", :last_name_string => "User", :address => "11 Eleven St", :Healthcare => "Geo Blue", :password => "pass", :confirmPassword => "pass"} }
        expect(response).to redirect_to(login_path)
      end
    end
  end

end