Rails.application.routes.draw do
  resources :orders
  resources :pays
  resources :ausgabes
  resources :pizzas
  root :to => 'pizzas#index'
  post '/ausgabe/pizza_done', to:'ausgabes#pizza_done'
  post '/pay/pizza_done', to:'pays#pizza_done'
 # post 'ausgabe/pizza_done'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
