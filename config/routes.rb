Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'tweet#show'

  get '/tweet/new', to: 'tweet#new'
  post '/tweet/new', to: 'tweet#create'
  resource :tweet
end
