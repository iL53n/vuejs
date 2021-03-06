class Staff::OrganizationsController < ApplicationController
  before_action :authenticate_staff!
  skip_before_action :verify_authenticity_token
  before_action :load_organization, only: %i[show destroy update]

  layout false

  def index
    find_organizations = FindOrganizations.new(Organization.all, params)
    @organizations = find_organizations.call(search_permitted_params)
    org_presenter_meta = OrganizationPresenter.new.meta
    meta = find_organizations.meta.merge(org_presenter_meta)

    render json: OrganizationSerializer.new(@organizations, { meta: meta }).serialized_json
  end

  def show
    render json: @organization, status: :ok
  end

  def create
    @organization = Organization.new(organization_params)

    if @organization.save
      render json: @organization, status: :created
    else
      render json: { errors: @organization.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    @organization.destroy
  end

  def update
    if @organization.update(organization_params)
      render json: @organization, status: :created
    else
      render json: { errors: @organization.errors }, status: :unprocessable_entity
    end
  end

  private

  def load_organization
    @organization ||= Organization.find(params[:id])
  end

  def organization_params
    params.permit(:title,
                  :form_of_owership,
                  :tax_number,
                  :reg_number,
                  client_ids: [],
                  clients: [])
  end

  def search_permitted_params
    params.permit(:filter,
                  :sortBy,
                  :descending,
                  :page,
                  :rowsPerPage,
                  :rowsNumber)
  end
end
