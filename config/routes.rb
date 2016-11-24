Rails.application.routes.draw do
  devise_for :users

  #Route for landing page
  get 'welcome/index'

  #Routes for static pages
  get '/about' => 'welcome#about'
  get '/contact' => 'welcome#contact'

  resources :articles do
  	resources :comments
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#index'
end
