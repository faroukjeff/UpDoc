require 'rails_helper'

RSpec.describe HomepageController, type: :controller do
    
    describe "homepage" do
      it "obtains hospitals list" do
        expect(Hospital).to receive(:all)
        allow(Pharmacy).to receive(:all)
        post :home, {:refresh => 'refresh'}
        expect(response).to redirect_to(homepage_home_path)
      end
      it "obtains pharmacies list" do
        allow(Hospital).to receive(:all)
        expect(Pharmacy).to receive(:all)
        post :home, {:refresh => 'refresh'}
        expect(response).to redirect_to(homepage_home_path)
      end
    end
    
end