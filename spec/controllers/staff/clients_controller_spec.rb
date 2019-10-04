require 'rails_helper'

RSpec.describe Staff::ClientsController, type: :controller do
  describe 'GET #index' do
    let(:staff) { create(:staff) }
    let(:clients) { create_list(:client, 3) }
    let(:request_params) { { method: :get, action: :index, format: :json } }
    before { login(staff) }

    it 'return 2xx' do
      do_request(request_params)
      expect(response).to have_http_status(:success)
    end

    it 'return clients list' do #ToDo
      do_request(request_params)

      expect(response.to_json).to eq Client.all.to_json
    end
  end

  describe 'GET #create' do
    let(:staff) { create(:staff) }
    let(:params) { { client: attributes_for(:client) } }
    let(:request_params) { { method: :post, action: :create, options: params, format: :json } }
    before { login(staff) }

    it 'return :created' do
      do_request(request_params)
      expect(response).to have_http_status(:created)
    end

    it 'saves a new client in the database' do
      expect do
        do_request(request_params)
      end.to change(Client, :count).by(1)
    end

    it 'return created client' do #ToDO
      do_request(request_params)

      expect(json.to_json).to eq Client.last.to_json
    end
  end
end