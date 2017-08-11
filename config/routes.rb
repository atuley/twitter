Rails.application.routes.draw do
  get 'sessions/new'
  resources :sessions

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  delete 'logout', to: 'sessions#destroy', as: 'logout'
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'tweet#index'
  get '/tweet/new', to: 'tweet#new'
  post '/tweet/new', to: 'tweet#create'
  resources :tweet
end
