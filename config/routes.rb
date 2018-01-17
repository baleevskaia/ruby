Rails.application.routes.draw do
  get 'public_pages/home'

  get 'auth0/callback'

  get 'auth0/failure'

  get 'home/index'
  post 'home/calculate'
  post 'home/calculate_ui'
  # root 'home#index'
  root 'public_pages#login'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Auth0 routes for authentication
  get '/auth/auth0/callback' => 'auth0#callback'
  get '/auth/failure'        => 'auth0#failure'

end
