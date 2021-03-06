Rails.application.routes.draw do

  mount ActionCable.server => '/cable'

  resources :categories

  get 'conversations/index'

  #Route for Admin
  get '/admin-panel' => 'admin#index'
  post'/admin-panel' => 'admin#create'
  get '/admin-create' => 'admin#new'

  devise_for :users

  #Routes for conversations
  resources :conversations, only: [:index, :create, :new, :show]

  #Routes for messages
  # resources :messages

  #Route for landing page
  get 'welcome/index'

  #Routes for static pages
  get '/about' => 'welcome#about'

  get '/contact' => 'contact#index'
  post "/contact", to: "contact#create"

  resources :articles do
  	resources :comments
  end
  #Route for like/Unlike button

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#index'
end
