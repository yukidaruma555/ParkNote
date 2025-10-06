Rails.application.routes.draw do
 
  devise_for :admin, skip: [:registration, :password], controllers: {
    sessions: 'admin/sessions'
  }

  namespace :admin do
    get 'dashboards', to: 'dashboards#index'
    resource :users, only: [:destroy]
  end

  get 'users/show'
  get 'users/edit'
  devise_for :users
  root to: "homes#top"

  resources :parks, only: [:new, :create, :index, :show, :edit, :update, :destroy]
  resources :posts, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
    resources :post_comments, only: [:create]
  end
  resources :users, only: [:show, :edit, :update, :destroy]

  get "/homes/about", to: "homes#about", as: 'about'
 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
