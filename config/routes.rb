Rails.application.routes.draw do
  resources :achievemnets
  get 'pages/tv_view'
  resources :announcements
  resources :mvpwins
  get 'user/secret_update/:id' => 'users#secret_admin_update'
  resources :nominations
  devise_for :users
  devise_scope :user do  
    post '/users/sign_out' => 'devise/sessions#destroy'     
  end
  resources :users, only: [:index, :show, :edit, :update, :delete]

  resources :stats

  root 'nominations#index'
 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
