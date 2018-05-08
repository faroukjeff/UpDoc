require 'rails_helper'

RSpec.describe ForgotpassController, type: :controller do




describe 'GET forgotpass' do
    def do_get
      get :forgotpass
    end

    it 'responds with http success' do
      do_get
      expect(response).to have_http_status(:success)
    end

    it 'renders the index template' do
      do_get
      expect(response).to render_template('forgotpass/forgotpass')
    end
  end


end    