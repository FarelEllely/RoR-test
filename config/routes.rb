Rails.application.routes.draw do
  #Route for Admin
  get '/admin-panel' => 'admin#index'

  devise_for :users

  

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
