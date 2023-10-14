Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get 'index', to: "articles#index"

  resources :articles, only: [:index, :show, :new, :create, :edit, :update, :destroy]
end
