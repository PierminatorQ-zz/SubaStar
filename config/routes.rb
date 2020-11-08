Rails.application.routes.draw do

  root to: "auctions#index"
  resources :bids
  resources :auctions
  resources :products
  devise_for :users
  resources :categories
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end