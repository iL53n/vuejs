require 'rails_helper'

RSpec.describe Staff::WelcomeController, type: :controller do


  describe 'GET #index' do
    context 'if current_staff' do
      before { login(create(:staff)) }

      it 'return 2xx' do
        get :index
        expect(response).to have_http_status(:success)
      end
    end

    context 'if current_client' do
      before { login(create(:client)) }

      it 'return 3xx' do
        get :index
        expect(response).to have_http_status(:redirect)
      end
    end
  end
end