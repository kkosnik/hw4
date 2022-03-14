Rails.application.routes.draw do
  get "/", controller: "posts", action: "index"
  resources :sessions
  resources :users
  resources :places
  resources :posts
  root to: "places#index"
end
