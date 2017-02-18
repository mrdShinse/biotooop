Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: 'users/registrations'}

  get 'home/index', to: 'home#index'
  get 'index', to: 'home#index'
  get '/', to: 'home#index'
  root 'home#index'
  get 'home/authentication'

  get 'tags/search', to: 'tags#search'
  resources :tags

  # Web API
  namespace :api, {format: 'json'} do
    namespace :v1 do
      namespace :tags do
        get "/" , :action => "index"
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
