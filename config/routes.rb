Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations"}

  resources :users, only: [ :index, :show, :edit, :update ]
  # get '/users', to: 'users#index'
  # get '/users/:id', to: 'users#show'
  # get '/users/:id/edit', to: 'users#edit'
  # patch '/users/:id/', to: 'users#update'

  resources :user_skills, only: [ :new, :create, :destroy ]

  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
