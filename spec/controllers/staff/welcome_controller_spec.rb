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

  describe 'GET #user' do
    let(:staff) { create(:staff) }
    let(:request_params) { { method: :get, action: :user, format: :json } }
    before { login(staff) }

    it 'return 2xx' do
      do_request(request_params)
      expect(response).to have_http_status(:success)
    end

    it 'return user' do # ToDo
      do_request(request_params)

      expect(response.to_json).to eq Staff.last.to_json
    end
  end
end