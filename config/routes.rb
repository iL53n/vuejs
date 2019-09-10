Rails.application.routes.draw do

  devise_for :clients
  devise_for :staffs

  root 'application#index'

  namespace :users do
    namespace :clients do
      root to: 'welcome#index'
    end
  end

  namespace :users do
    namespace :staffs do
      root to: 'welcome#index'
    end
  end
end
