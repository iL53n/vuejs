Rails.application.routes.draw do
  root to: 'application#index'

  devise_for :client, controllers: { sessions: 'client/sessions' }
  devise_for :staff, controllers: { sessions: 'staff/sessions' }

  namespace :client do
    root to: 'index#index'
    resources :index, only: :index do
      get :user, on: :collection
    end
  end

  namespace :staff do
    root to: 'index#index'
    resources :index, only: :index do
      get :user, on: :collection
    end

    resources :clients, only: %i[index create destroy]
    resources :staffs, only: %i[index create destroy]
    resources :organizations, only: %i[index create destroy]
  end

  get '/*slug', to: 'staff/organizations#index'
end