Rails.application.routes.draw do

  # devise_for :users
  root to: 'pages#home'
  resources :user_profiles, only: [:new, :create, :update]
  get "user_profiles/edit"
  get 'dashboard', to: "pages#dashboard"

  devise_for :users, controllers: {
    registrations: 'users/registrations'
}

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :tests, only: [:index, :show]

  get 'results', to: 'pages#results'

end
