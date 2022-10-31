Rails.application.routes.draw do
  get 'sessions/new'
  get 'users/new'
  get 'projects/index'
  root 'projects#index'
  resources :users
  resources :projects
  
  get   'time', to: 'projects#time'
  post  'time', to: 'projects#update'
  get   'projects/goal'
  get   'projects/result'
  get   'projects/feedback'
  
  get   '/login',   to: 'sessions#new'
  post  '/login',   to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
end
