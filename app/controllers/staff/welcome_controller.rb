class Staff::WelcomeController < ApplicationController
  include Accessible

  before_action :authenticate_staff!, only: :index

  def index; end

  def user
    @user = current_staff
  end
end