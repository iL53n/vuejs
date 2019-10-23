class Staff::ClientsController < ApplicationController
  before_action :authenticate_staff!
  skip_before_action :verify_authenticity_token
  before_action :load_client, only: %i[show destroy update reset_pass]

  def index
    render json: Client.all
  end

  def create
    @client = Client.new(client_params)

    if @client.save
      render json: @client, status: :created
    else
      render json: { errors: @client.errors }, status: :unprocessable_entity
    end
  end

  def show
    render json: @client, status: :ok
  end

  def destroy
    @client.destroy
  end

  def update
    if @client.update!(client_params)
      render json: @client, status: :created
    else
      render json: { errors: @client.errors }, status: :unprocessable_entity
    end
  end

  def reset_pass
    @client.send_reset_password_instructions
  end

  private

  def load_client
    @client ||= Client.find(params[:id])
  end

  def client_params
    params.permit(:id,
                  :email,
                  :fullname,
                  :phone,
                  organization_ids: [])
  end
end