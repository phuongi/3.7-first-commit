Rails.application.routes.draw do
  devise_for :users, :path => '', :path_names => {:sign_in => 'login', :sign_out => 'logout'}
  resources :users
  
  resources :orders, only: [:index, :show, :create, :destroy]
 
  mount ActionCable.server => '/cable'

  get 'static_pages/about'

  get 'static_pages/contact'

  get 'static_pages/index'

  get '/products/:id', to: 'products#show'

  root 'static_pages#landing_page'

  post 'static_pages/thank_you'

  resources :products do
   resources :comments
  end 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
