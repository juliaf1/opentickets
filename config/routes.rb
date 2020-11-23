Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [ :index, :show, :edit, :update ]
  # get '/users', to: 'users#index'
  # get '/users/:id', to: 'users#show'
  # get '/users/:id/edit', to: 'users#edit'
  # patch '/users/:id/', to: 'users#update'

  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
