require 'rails_helper'

RSpec.describe DocsignupController, type: :controller do


  describe "doctor account creation" do
    context "fails to confirm password" do
      it "and redirects to sign up" do
        post :add, {:session => {:username => "New@bun.com", :first_name => "New", :last_name_string => "User", :address => "11 Eleven St", :pnumber => "D12", :password => "pass", :confirmPassword => "pass2"} }
        expect(response).to redirect_to(admin_docsignup_path)
      end
      it "and notifies user" do
        post :add, {:session => {:username => "New@bun.com", :first_name => "New", :last_name_string => "User", :address => "11 Eleven St", :pnumber => "D12", :password => "pass", :confirmPassword => "pass2"} }
        expect(flash[:notice]).to have_content("Passwords don't match")
      end
    end
    
    context "receives incomplete fields" do
      it "and redirects to sign up" do
        post :add, {:session => {:username => nil, :first_name => "New", :last_name_string => "User", :address => "11 Eleven St", :pnumber => "D12", :password => "pass", :confirmPassword => "pass"} }
        expect(response).to redirect_to(admin_docsignup_path)
      end
      it "and notifies user" do
        post :add, {:session => {:username => nil, :first_name => "New", :last_name_string => "User", :address => "11 Eleven St", :pnumber => "D12", :password => "pass", :confirmPassword => "pass"} }
        expect(flash[:notice]).to have_content("Fields cannot be null")
      end
    end
    
    context "is successful and" do
      it "creates a profile" do
        expect(Profile).to receive(:create!).with(:username => "New@bun.com", :first_name => "New", :last_name_string => "User", :address => "11 Eleven St", :pnumber => "D12", :password => "pass")
        allow(Credential).to receive(:create!).with(:username => "New@bun.com", :password => "pass", :usertype => "D")
        post :add, {:session => {:username => "New@bun.com", :first_name => "New", :last_name_string => "User", :address => "11 Eleven St", :pnumber => "D12", :password => "pass", :confirmPassword => "pass"} }
      end
      it "creates a credential" do
        allow(Profile).to receive(:create!).with(:username => "New@bun.com", :first_name => "New", :last_name_string => "User", :address => "11 Eleven St", :pnumber => "D12", :password => "pass")
        expect(Credential).to receive(:create!).with(:username => "New@bun.com", :password => "pass", :usertype => "D")
        post :add, {:session => {:username => "New@bun.com", :first_name => "New", :last_name_string => "User", :address => "11 Eleven St", :pnumber => "D12", :password => "pass", :confirmPassword => "pass"} }
      end
      it "redirects to admin page" do
        allow(Profile).to receive(:create!).with(:username => "New@bun.com", :first_name => "New", :last_name_string => "User", :address => "11 Eleven St", :pnumber => "D12", :password => "pass")
        allow(Credential).to receive(:create!).with(:username => "New@bun.com", :password => "pass", :usertype => "D")
        post :add, {:session => {:username => "New@bun.com", :first_name => "New", :last_name_string => "User", :address => "11 Eleven St", :pnumber => "D12", :password => "pass", :confirmPassword => "pass"} }
        expect(response).to redirect_to(admin_admin_path)
      end
    end
    
  end

end
