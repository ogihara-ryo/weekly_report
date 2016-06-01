Rails.application.routes.draw do
  resources :reports do
    resources :comments
  end

  root 'welcome#index'

  resources :users

  get 'signin' => 'sessions#new'
  post 'signin' => 'sessions#create'
  delete 'signout' => 'sessions#destroy'
end
