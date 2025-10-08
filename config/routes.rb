Rails.application.routes.draw do
 
  devise_for :admin, skip: [:registration, :password], controllers: {
    sessions: 'admin/sessions'
  }

  namespace :admin do
    root to: 'dashboards#index'
    get 'dashboards', to: 'dashboards#index'
    resources :users, only: [:destroy]
  end

  devise_for :users

  scope module: :public do
    root to: "homes#top"

    resources :parks, only: [:new, :create, :index, :show, :edit, :update, :destroy]
    resources :posts, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
      resources :post_comments, only: [:create]
    end
    resources :users, only: [:show, :edit, :update, :destroy]

    get "/homes/about", to: "homes#about", as: 'about'
  end
end
