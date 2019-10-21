class Staff::StaffsController < ApplicationController
  before_action :authenticate_staff!
  skip_before_action :verify_authenticity_token
  before_action :load_staff, only: %i[show destroy update reset_pass]

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

  def show
    render json: @staff, status: :ok
  end

  def destroy
    @staff.destroy
  end

  def update
    if @staff.update(staff_params)
      render json: @staff, status: :created
    else
      render json: { errors: @staff.errors }, status: :unprocessable_entity
    end
  end

  def reset_pass
    @staff.send_reset_password_instructions
  end

  private

  def load_staff
    @staff = Staff.find(params[:id])
  end

  def staff_params
    params.require(:staff).permit(:email)
  end
end