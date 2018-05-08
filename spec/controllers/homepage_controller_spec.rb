require 'rails_helper'

RSpec.describe HomepageController, type: :controller do
    
    describe "homepage" do
       it "is refreshed" do
           post :home, {:refresh => 'refresh'}
           expect(assigns(:hospitals)).to eq(Hospital.all)
           expect(assigns(:Pharmacys)).to eq(Pharmacy.all)
           expect(response).to redirect_to(homepage_home_path)
       end
    end
    
end