Rails.application.routes.draw do
 
  devise_for :users
  root to: "homes#top"

  resources :parks, only: [:new, :create, :index, :show, :edit, :update]
  resources :posts, only: [:new, :create, :index, :show, :edit, :update, :destroy]

  get "/homes/about", to: "homes#about", as: 'about'
 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
