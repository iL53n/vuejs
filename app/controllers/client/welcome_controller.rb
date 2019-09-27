class Client::WelcomeController < ApplicationController
  include Accessible
  before_action :authenticate_client!, except: :clients

  def index; end

  def clients
    render json: Client.all
  end

  def user
    @user = current_client
  end
end