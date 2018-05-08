require 'rails_helper'

RSpec.describe ContactUs::ContactsController, type: :controller do




describe 'GET new' do
    def do_get
      get :new
    end

    it 'responds with http success' do
      do_get
      expect(response).to have_http_status(:success)
    end

    it 'renders the index template' do
      do_get
      expect(response).to render_template('contact_us/contacts/new')
    end
  end


end    