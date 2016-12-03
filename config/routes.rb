Rails.application.routes.draw do
  #Route for Admin
  get '/admin-panel' => 'admin#index'

  devise_for :users

  #Routes for Mailboxer
  resources :conversations, only: [:index, :show, :new, :create] do
    member do
      post :reply
      post :restore
      post :mark_as_read
    end
  end
  resources :conversations, only: [:index, :show, :destroy] do
    collection do
      delete :empty_trash
    end
  end

  #Routes for Messages
  resources :messages, only: [:new, :create]
  resources :users, only: [:index]

  #Route for landing page
  get 'welcome/index'

  #Routes for static pages
  get '/about' => 'welcome#about'
  get '/contact' => 'welcome#contact'

  resources :articles do
  	resources :comments
  end
  #Route for like/Unlike button

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#index'
end
