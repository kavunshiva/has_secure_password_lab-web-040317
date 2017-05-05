Rails.application.routes.draw do
  resources :users

  get '/login', to: 'sessions#new', as: 'login' # get
  post '/login', to: 'sessions#create' # post
  delete 'logout', to: 'sessions#destroy', as: 'logout' # delete
  get '/welcome', to: 'welcome#index', as: 'welcome' # get
end
