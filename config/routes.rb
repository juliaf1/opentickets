Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations"}

  resources :users, only: [ :index, :show, :edit, :update ] do
    resources :tickets, only: [ :index ]
  end



  # get '/users', to: 'users#index'
  # get '/users/:id', to: 'users#show'
  # get '/users/:id/edit', to: 'users#edit'
  # patch '/users/:id/', to: 'users#update'

  resources :user_skills, only: [ :new, :create, :destroy ]

  resources :timeslots, only: [ :new, :create, :destroy ] do
    resources :tickets, only: [ :new, :create ]
  end

  resources :tickets, only: :destroy

  resources :tickets, only: [] do
    resources :reviews, only: [ :new, :create ]
  end

  root to: 'pages#home'
  get "/components", to: 'pages#components'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
