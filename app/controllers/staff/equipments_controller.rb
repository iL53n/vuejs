class Staff::EquipmentsController < ApplicationController
  before_action :authenticate_staff!
  skip_before_action :verify_authenticity_token
  before_action :load_equipment, only: %i[show destroy update]

  def index
    render json: Equipment.all
  end

  def show
    render json: @equipment, status: :ok
  end

  def create
    @equipment = Equipment.new(equipment_params)

    if @equipment.save
      render json: @equipment, status: :created
    else
      render json: { errors: @equipment.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    @equipment.destroy
  end

  def update
    if @equipment.update(equipment_params)
      render json: @equipment, status: :created
    else
      render json: { errors: @equipment.errors }, status: :unprocessable_entity
    end
  end

  private

  def load_equipment
    @equipment ||= Equipment.find(params[:id])
  end

  def equipment_params
    params.permit(:title,
                  :kind,
                  :serial_number,
                  :organization_id,
                  :organization)
  end
end
