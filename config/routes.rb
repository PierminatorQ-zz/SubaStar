Rails.application.routes.draw do

  get 'dashboard', to:'dashboard#index'
  get 'perfil', to:'dashboard#perfil'
  get 'home/index'
  root to: "home#index"
  resources :bids

  resources :auctions do
    member do
      put "like" => "auctions#upvote"
      put "unlike" => "auctions#downvote"
      get :toggle_status
    end
  end
  resources :products
  devise_for :users
  resources :categories
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
