# frozen_string_literal: true

Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destory'


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Defines the root path route ("/")
  root "playlists#index"

  # PLAYLIST

  # discover page
  get '/playlists/discover', to: 'playlists#discover'
  post '/playlists/search', to: 'playlists#search'

  # new playlist 
  get '/playlists/new', to: 'playlists#new'
  post '/playlists/new', to: 'playlists#create'

  # edit playlist
  get '/playlists/:id/edit', to: 'playlists#edit'
  post '/playlists/:id/edit', to: 'playlists#update'
  post '/playlists/:id/edit/add', to: 'playlists#add_song'

  # playlist info 
  get '/playlists/:id/info', to: 'playlists#info'
  post '/add_click/:id', to: 'playlists#add_click'

  # my playlists 
  get '/account', to: 'playlists#account'
  post '/account/search', to: 'playlists#my_search'

  get '/playlists/:id/delete', to: 'playlists#delete'
  post '/playlists/:id/delete', to: 'playlists#destroy'

  # ACCOUNT

  get '/login', to: 'accounts#login'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'

  # create acc
  get '/createaccount', to: 'accounts#new'
  post '/createaccount', to:'accounts#create'

  # SONGS

  get '/songs/:id/delete', to: 'songs#delete'
  post '/songs/:id/delete', to: 'songs#destroy'

  # resources :accounts
  # resources :playlists
  # resources :songs


end
