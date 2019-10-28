class OrganizationsChannel < ApplicationCable::Channel
  def subscribed
    stream_for 'organizations'
  end
end