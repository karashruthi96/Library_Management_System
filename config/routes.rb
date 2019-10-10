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
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
