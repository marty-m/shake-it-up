Rails.application.routes.draw do
  get 'search/searchResults'
  get 'search/cocktailPage'
  get 'search/randomPage'
  post "search/searchResults", to: "search#create"
  root 'home#index'
  resources :search
  resources :home
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
