require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      #get :new
      #expect(response).to have_http_status(:success)
      
      visit login_path
      within "form#login" do
      expect(page).to have_selector "input#session_username"
    end
    end
  end

end


