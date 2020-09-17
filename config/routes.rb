Rails.application.routes.draw do
  resources :messages
  resources :faqs
  resources :workshops
  resources :events
  resources :ads
  resources :posts
  resources :chats
  resources :users
  root 'pages#home'
  get 'login', to: 'pages#login'
  get 'logout', to: 'pages#logout'
end
