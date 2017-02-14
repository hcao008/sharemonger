Rails.application.routes.draw do
  resources :subscribers
  resources :visitors
  # resources :orders
  resources :comments
  get 'blogs/new'

  resources :items
  resources :profiles
  resources :blogs


  # Example manually defining routes for custom names and helpers
  get "orders", to: "orders#index"
  get "/orders/:id", to: "orders#show", as: "order"
  get "/feedback/:id/edit", to: "orders#edit", as: "edit_order"
  # edit_order_path

  #single route to search action and view
    get "search", to: "items#search"

  #define new route to show our search results
  get "results", to:"items#results"


#Add devise registrations controller to allow after sign up path
  devise_for :users, controllers: { registrations: "registrations" }
  root 'home#index'
  get 'home/index'

#Add About page routes
get 'about', to: 'home#about'
get 'privacy', to: 'home#privacy'
get 'terms', to: 'home#terms'
# get 'community', to: 'home#community'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

#Add Contact page routes
get 'contact', to: 'home#contact'

end
