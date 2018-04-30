require 'rails_helper'

RSpec.describe AdminController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "users display" do
    #it "shows all information" do
    #   expect
    #end
    it "can edit accounts" do
        
    end
  end

end
