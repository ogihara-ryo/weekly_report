Rails.application.routes.draw do
  root 'welcome#index'

  get 'signin' => 'sessions#new'
  post 'signin' => 'sessions#create'
  delete 'signout' => 'sessions#destroy'

  resources :users
  resources :reports do
    resources :comments
  end
end
