Rails.application.routes.draw do
  get 'home/index'
  post 'home/calculate'
  post 'home/calculate_ui'
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
