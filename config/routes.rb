Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :new, :show, :create] do
      resources :comments, only: [:new, :create]
      resources :likes, only: [:create]
    end
  end

  # Defines the root path route ("/")
  # root "articles#index"
  root 'users#index', as: 'home'
end
