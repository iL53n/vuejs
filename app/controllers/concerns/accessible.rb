module Accessible
  extend ActiveSupport::Concern

  included do
    before_action :check_user
  end

  protected

  def check_user
    if current_client
      flash.clear
      render client_root_path && return
    elsif current_staff
      flash.clear
      render staff_root_path && return
    end
  end
end