Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'
  resources :user_profiles, only: [:new, :create, :update]
  get "user_profiles/edit"
  get 'dashboard', to: "pages#dashboard"


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


end
