class Staff::ClientsController < ApplicationController
  before_action :authenticate_staff!
  skip_before_action :verify_authenticity_token, only: :create

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

	private

	def client_params
		params.require(:client).permit(:email, :fullname, :phone)
	end
end