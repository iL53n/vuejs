class Client::WelcomeController < ApplicationController
  include Accessible
  before_action :authenticate_client!, only: :index

  def index; end
end