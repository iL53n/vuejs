require 'rails_helper'

RSpec.describe Staff::OrganizationsController, type: :controller do
  describe 'GET #index' do
    let(:staff) { create(:staff) }
    let(:organizations) { create_list(:organization, 3) }
    let(:request_params) { { method: :get, action: :index, format: :json } }
    before { login(staff) }

    it 'return 2xx' do
      do_request(request_params)
      expect(response).to have_http_status(:success)
    end

    it 'return organizations list' do #ToDo
      do_request(request_params)

      expect(response.to_json).to eq Organization.all.to_json
    end
  end

  describe 'GET #create' do
    let(:staff) { create(:staff) }
    let(:params) { { organization: attributes_for(:organization) } }
    let(:request_params) { { method: :post, action: :create, options: params, format: :json } }
    before { login(staff) }

    it 'return :created' do
      do_request(request_params)
      expect(response).to have_http_status(:created)
    end

    it 'saves a new organization in the database' do
      expect do
        do_request(request_params)
      end.to change(Organization, :count).by(1)
    end

    it 'return created organization' do #ToDO
      do_request(request_params)

      expect(json.to_json).to eq Organization.last.to_json
    end
  end

  describe 'DELETE #destroy' do
    let(:staff) { create(:staff) }
    let(:params) { { organization: attributes_for(:organization) } }
    let(:request_params) { { method: :delete, action: :destroy, options: params, format: :json } }
    before { login(staff) }

    it 'return 2xx' do
      do_request(request_params)
      expect(response).to have_http_status(:success)
    end

    it 'delete organization from the database' do
      expect do
        do_request(request_params)
      end.to change(Organization, :count).by(-1)
    end

    # it 'return created organization' do #ToDO
    #   do_request(request_params)
    #
    #   expect(json.to_json).to eq Organization.last.to_json
    # end
  end
end