class Staff::OrganizationsController < ApplicationController
  before_action :authenticate_staff!
  skip_before_action :verify_authenticity_token

  def index
    render json: Organization.all
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
    @organization = Organization.find(params[:id])
    @organization.destroy
  end

  private

  def organization_params
    params.require(:organization).permit(:title, :form_of_owership, :tax_number, :reg_number)
  end
end
