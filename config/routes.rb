Rails.application.routes.draw do
  resources :reservations
  resources :books do
    member do
      post "checkout" => "books#checkout"
    end
  end
  resources :libraries
  resources :books do member do post :checkout end end
  root to: 'dashboard#home'
  devise_for :users
  resources :dashboard do
    member do
      get 'index' => 'dashboard#index'
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
