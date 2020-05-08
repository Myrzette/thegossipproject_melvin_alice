Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get root 'pages#home'
  
  get '/team', to: 'pages#presentation', as: 'team'

  get '/contact', to: 'pages#contact', as: 'contact'

  get '/welcome/:name', to: 'pages#welcome', as: 'welcome'
  
  resources :users, only: [:show, :new, :create]

  resources :cities, only: [:show]

  resources :gossips do
    resources :like, only: [:create, :destroy]
  end

  resources :sessions, only: [:new, :create, :destroy]
end
