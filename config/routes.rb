Rails.application.routes.draw do
  get 'sessions/new'
  
  get '/new_micropost', to: 'microposts#new'
  get '/list', to: 'users#list'
  post '/new_micropost', to: 'microposts#create'
  get 'users/new'
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  get 'static_pages/home'
  root 'static_pages#home'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users
  resources :microposts,          only: [:create, :update, :new]

end
