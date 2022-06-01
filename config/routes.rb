Rails.application.routes.draw do
  get 'user_profiles/new'
  get 'user_profiles/create'
  get 'user_profiles/show'
  get 'user_profiles/find'
  get 'user_profiles/edit'
  get 'user_profiles/destroy'

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
