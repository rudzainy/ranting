Rails.application.routes.draw do
  get 'pricing', to: 'static#pricing'
  get 'licences_disclaimer', to: 'static#licences_disclaimer'
  get 'contact', to: 'static#contact'
  get 'about', to: 'static#about'

  patch 'links/:id' => 'links#update', as: :links
  
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  get 'dashboard', to: 'dashboard#index'
  get 'design', to: 'dashboard#design'
  root 'dashboard#index'

  get ':id', to: 'links#show', as: :user
  
  get "/service-worker.js" => "service_worker#service_worker"
  get "/manifest.json" => "service_worker#manifest"
end
