Rails.application.routes.draw do
  devise_for :clients
  devise_for :staffs
  root 'application#index'
end
