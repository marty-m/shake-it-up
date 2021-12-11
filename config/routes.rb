Rails.application.routes.draw do
  get 'search/searchResults'
  get 'search/cocktailPage'
  root 'home#index'
  post 'search_form', to:'search#searchResults', as: 'searchResults'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
