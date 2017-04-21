Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: 'users/registrations'}

  get 'home/index', to: 'home#index'
  get 'index', to: 'home#index'
  get '/', to: 'home#index'
  root 'home#index'
  get 'home/authentication'

  get 'tags/search', to: 'tags#search'

  resources :groups, :tags, :user_tags
  resources :events do
    collection do
      get 'open'
      post 'join'
      post 'cancel'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
