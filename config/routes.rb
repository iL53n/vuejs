Rails.application.routes.draw do
  root to: 'application#index'

  devise_for :client, controllers: { sessions: 'client/sessions' }
  devise_for :staff, controllers: { sessions: 'staff/sessions' }

  namespace :client do
    root to: 'welcome#index'
  end

  namespace :staff do
    root to: 'welcome#index'
  end
end
