Rails.application.routes.draw do
  get 'sessions/new'
  get 'users/new'
  get 'projects/index'
  root 'sessions#new'
  resources :users
  resources :projects
  
  get   'projects/time', to: 'projects#time'
  post  'projects/time', to: 'projects#update'
  get   'projects/result', to: 'projects#result'
  get   'projects/feedback', to: 'projects#feedback'
  post  'projects/goal', to: 'projects#update'
  get   'projects/:id/goal', to: 'projects#goal'
  
  get   '/login',   to: 'sessions#new'
  post  '/login',   to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
end
