Rails.application.routes.draw do
  get 'tasks/new'
  get 'sessions/new'
  get 'users/new'
  get 'projects/index'
  root 'sessions#new'
 
  get   'time', to: 'projects#time'
  patch  'time', to: 'projects#update'
  get   'result', to: 'projects#result'
  patch 'result', to: 'projects#update'
  get   'projects/feedback', to: 'projects#feedback'
  get   'projects/goal', to: 'projects#goal'
  patch 'projects/goal', to: 'projects#goal'
  
  get   '/login',   to: 'sessions#new'
  post  '/login',   to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  post 'task',       to: 'tasks#create'
  
  resources :users
  resources :projects
  
end
