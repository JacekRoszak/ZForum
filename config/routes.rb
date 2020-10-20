Rails.application.routes.draw do
  resources :comment_comment_likes
  resources :comment_likes
  resources :comments_comments
  resources :post_comments
  resources :comments
  resources :post_likes
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
