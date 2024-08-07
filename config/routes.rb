# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Defines the root path route ("/")
  root "playlists#index"

  # discover page
  get '/playlists/discover', to: 'playlists#discover'
  post '/playlists/discover', to: 'playlists#search'

  # new playlist 
  get '/playlists/new', to: 'playlists#new'
  post '/playlists/new', to: 'playlists#create'

  # edit playlist
  get '/playlists/:id/edit', to: 'playlists#edit'
  post '/playlists/:id/edit', to: 'playlists#update'

  # playlist info 
  get '/playlists/:id/info', to: 'playlists#info'

  
  # resources :accounts
  # resources :playlists
  # resources :songs
end
