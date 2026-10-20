Rails.application.routes.draw do
  root 'dashboard#index'
  get 'main/index'
  post 'favorites', to: 'favorites#create'
  get "period/index", to: "period#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
