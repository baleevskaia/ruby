Rails.application.routes.draw do
  get 'authentication/login'
  get 'authentication/logout'
  get 'auth0/callback'

  get 'auth0/failure'

  get 'home/index'
  post 'home/calculate'
  post 'home/calculate_ui'
  # root 'home#index'
  root 'authentication#login'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Auth0 routes for authentication
  get '/auth/auth0/callback' => 'auth0#callback'
  get '/auth/failure'        => 'auth0#failure'

end
