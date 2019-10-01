class Client::WelcomeController < ApplicationController
  include Accessible
  before_action :authenticate_client!

  def index; end

  def user
    @user = current_client
  end
end