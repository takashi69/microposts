Rails.application.routes.draw do
  root to: 'toppages#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'signup', to: 'users#new'
  
  get 'microposts', to: "microposts#create"
  get 'microposts', to: "microposts#destroy"
  
  
  resources :users, only: [:index, :show, :new, :create] do
    member do
      get :followings
      get :followers    
      get :currentfavs

      #↑お気に入りのところのget
    end
    collection do
      get :search
    end
  end

  resources :microposts, only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]
  resources :stocks, only: [:create, :destroy]

end