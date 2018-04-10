Rails.application.routes.draw do
  resources :likes
  resources :dogs
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post 'authenticate', to: 'authentication#authenticate'
  post 'authenticate_by_token', to: 'authentication#authenticate_by_token'
end
