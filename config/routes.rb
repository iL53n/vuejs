Rails.application.routes.draw do
  root to: 'staff/index#index'

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

    resources :clients, only: %i[index create show update destroy] do
      post :reset_pass, on: :member
    end
    resources :staffs, only: %i[index create show update destroy] do
      post :reset_pass, on: :member
    end
    resources :organizations, only: %i[index create show update destroy]
    resources :equipments, only: %i[index create show update destroy]
  end

  get '/*slug', to: 'staff/index#index'
end