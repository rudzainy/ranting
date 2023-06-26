Rails.application.routes.draw do

  patch 'links/:id' => 'links#update', as: :links
  
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  get 'dashboard', to: 'dashboard#index'
  get 'design', to: 'dashboard#design'
  root 'dashboard#index'

  get ':id', to: 'dashboard#show', as: :user
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
