Rails.application.routes.draw do

  get 'dashboard', to:'dashboard#index'
  get 'productos', to:'dashboard#productos'
  get 'dashboard/auctions'
  get 'perfil', to:'dashboard#perfil'
  get 'home/index'
  root to: "home#index"
  resources :bids

  #resource :cart, only: [:destroy]
  get 'carrito', to:'cart#show'
  get 'success', to:'cart#pay_success'
  delete 'destroy', to: 'cart#destroy'
  
  resources :auctions do
    member do
      put "like" => "auctions#upvote"
      put "unlike" => "auctions#downvote"
      get :toggle_status
    end
  end
  resources :products
  devise_for :users, controllers: { 
    omniauth_callbacks: 'users/omniauth_callbacks' 
  }
  resources :categories
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
