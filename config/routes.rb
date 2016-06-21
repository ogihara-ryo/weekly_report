Rails.application.routes.draw do
  root 'welcome#index'

  get 'signin' => 'sessions#new'
  post 'signin' => 'sessions#create'
  delete 'signout' => 'sessions#destroy'

  resources :users
  resources :favorite_users, only: :index
  post 'favorite_user' => 'favorite_users#toggle'

  resources :reports do
    resources :comments, only: %i(create edit update destroy)
  end
end
