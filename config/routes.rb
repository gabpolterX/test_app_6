Rails.application.routes.draw do
  
  root 'pages#home'
  get 'about', to: 'pages#about'
  get 'alpha', to: 'pages#alpha'
  resources :articles

end
