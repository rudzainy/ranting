Rails.application.routes.draw do
  
  get "/service-worker.js" => "service_worker#service_worker"
  get "/manifest.json" => "service_worker#manifest"

  get 'membership', to: 'static#membership'
  get 'licences_disclaimer', to: 'static#licences_disclaimer'
  get 'contact', to: 'static#contact'
  get 'usecases', to: 'static#use_cases'
  get 'about', to: 'users#about', as: :about
  get 'faq', to: 'static#faq'
  get 'short_links/free', to: 'short_links#free', as: :free_short_links
  post 'mailing_list', to: 'static#mailing_list'

  patch 'drag/links'

  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  resources :links, except: :destroy
  resources :users, only: :edit
  resources :short_links
  resources :short_link_redirects, only: %i[show], param: :url_token
  resources :qr_codes
  resources :groups, only: [:edit, :update]

  resources :links, only: [] do
    scope module: "links" do
      resources :short_links, only: %i[ create ]
    end
  end

  root 'static#index'


  get ':id', to: 'users#show', as: :user

  get '/r/:url_token', to: redirect('/short_link_redirects/%{url_token}')
end
