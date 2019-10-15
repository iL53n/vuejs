class Staff::StaffsController < ApplicationController
  before_action :authenticate_staff!
  skip_before_action :verify_authenticity_token

  def index
    render json: Staff.all
  end

  def create
    @staff = Staff.new(staff_params)

    if @staff.save!
      render json: @staff, status: :created
    else
      render json: { errors: @staff.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    @staff = Staff.find(params[:id])
    @staff.destroy
  end

  private

  def staff_params
    params.require(:staff).permit(:email)
  end
end