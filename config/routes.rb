Rails.application.routes.draw do
  resources :groups
  resources :events
  devise_for :users, controllers: {registrations: 'users/registrations'}

  get 'home/index', to: 'home#index'
  get 'index', to: 'home#index'
  get '/', to: 'home#index'
  root 'home#index'
  get 'home/authentication'

  get 'tags/search', to: 'tags#search'
  resources :tags
  resources :user_tags do
    # member do
    #   post 'create'
    # end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/welcome', to: 'welcomes#index'
end
