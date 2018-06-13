Rails.application.routes.draw do
  resources :categories
  resources :bookmark_categories
  resources :comments
  resources :subscriptions
  resources :bookmarks
  resources :follows
  resources :users
  post '/login', to: 'authentication#authenticate'
  post '/register', to: 'authentication#register'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
