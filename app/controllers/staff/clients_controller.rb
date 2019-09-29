class Staff::ClientsController < ApplicationController
	include Accessible
	# before_action :authenticate_staff!, except: :clients
	skip_before_action :verify_authenticity_token, only: :create

	def index
		render json: Client.all
	end

	def create
		@client = Client.new(client_params)

		if @client.save!
			render json: @client, status: :created
		else
			# render error_json, status: :unprocessable_entity
		end
	end

	def user
		@user = current_client
	end

	private

	def client_params
		params.require(:client).permit(:email, :fullname, :phone, :password)
	end

	def error_json
		#
	end
end