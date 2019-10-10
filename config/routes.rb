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
  get 'Lib_approvals', to: 'dashboard#Lib_approvals'
  get 'users.:id', to: 'dashboard#show'
  get 'edit.:id', to: 'dashboard#edit'
  get 'update.:id', to:'dashboard#update'
  get 'deleteuser.:id' ,to:'dashboard#deleteuser'
  get 'addremove' ,to:'books#addremove'
  # put 'users/edit.:id', to: 'devise/registrations#edit'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
