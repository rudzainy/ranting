Rails.application.routes.draw do
  
  get "/service-worker.js" => "service_worker#service_worker"
  get "/manifest.json" => "service_worker#manifest"
  
  get 'pricing', to: 'static#pricing'
  get 'licences_disclaimer', to: 'static#licences_disclaimer'
  get 'contact', to: 'static#contact'
  get 'about', to: 'static#about'

  resources :links, except: :destroy

  patch 'drag/links'
  
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  get 'analytics', to: 'analytics#index'
  get 'design', to: 'dashboard#design'
  root 'links#index'

  get ':id', to: 'links#show', as: :user
end
