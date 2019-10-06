Rails.application.routes.draw do
  resources :reservations
  resources :books
  resources :libraries
   root to: 'dashboard#home'
  devise_for :users
  resources :dashboard do
    member do
      get 'index' => 'dashboard#index'
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
