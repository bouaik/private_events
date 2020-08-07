# frozen_string_literal: true

Rails.application.routes.draw do
  resources :events, only: %i[create show index new]
  resources :users, only: [:create]
  # resources :sessions, only: [:new, :create, :destroy]
  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  post 'invitation', to: 'event_attendances#create'
  get 'logout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'
end
