class Staff::ClientsController < ApplicationController
  before_action :authenticate_staff!
  skip_before_action :verify_authenticity_token
  before_action :load_client, only: %i[destroy update]

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

  def destroy
    @client.destroy
  end

  def update
    @client.update(client_params)
  end

  private

  def load_client
    @client = Client.find(params[:id])
  end

  def client_params
    params.require(:client).permit(:email, :fullname, :phone)
  end
end