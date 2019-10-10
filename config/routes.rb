Rails.application.routes.draw do
  resources :reservations

  resources :libraries
  resources :books do member do
      post :checkout
      post :return
      get :hold
    end
    end

    resources :reservations do member do
      get :unhold, :defaults => { :format => 'html' }
      get :bookmark, :defaults => { :format => 'html' }
      get :unbookmark, :defaults => { :format => 'html' }
    end
    end

 #  resources :reservations do
 #  get :bookmark_show, :defaults => { :format => 'html' }
 # end
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
