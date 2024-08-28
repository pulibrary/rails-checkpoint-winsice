require 'rails_helper'
require_relative '../support/controller_helper.rb'

RSpec.configure do |c|
  c.include ControllerHelper
end

RSpec.describe PlaylistsController, type: :controller do

  let(:account) { Account.first }
  let(:playlist) { Playlist.first }

  let(:my_search_parameters) do
    {
      playlist_name: "testPlaylist",
      amount_of_listens: 10,
      category: ["Classical, Kpop"]
    }
  end 

  let(:search_parameters) do
    {
      username: "testAccount",
      playlist_name: "testPlaylist",
      amount_of_listens: 10,
      category: ["Classical, Kpop"]
    }
  end 

  let(:playlist_parameters) do
    {
      playlist_name: "testPlaylist",
      playlist_link: "https://open.spotify.com/",
      category: ["Classical, Kpop"]
    }
  end 

  let(:song_parameters) do
    {
      song_name_1: "test",
      artist_1: "test",
      song_name_2: "",
      artist_2: "",
      song_name_3: "",
      artist_3: "",
      song_name_4: "",
      artist_4: "",
      song_name_5: "",
      artist_5: ""
    }
  end

  

  describe "GET #index" do
    it "returns a successful response for the account" do
      login(account)
      get :index
      expect(session[:account_id]).to be_truthy
      expect(response).to be_successful
    end
  end 

  describe "GET #discover" do
    it "returns a successful response" do
      get :discover
      expect(response).to be_successful
    end 
  end 

  describe "GET #account" do
    it "returns a successful response" do
      get :account
      expect(response).to be_successful
    end 
  end

  describe "GET #new" do
    it "returns a successful response" do
      login(account)
      get :new
      expect(response).to be_successful
    end 
  end

  describe "GET #edit" do
    it "returns a successful response" do
      get :edit, params: { id: playlist.id }
      expect(response).to be_successful
    end 
  end 

  describe "GET #info" do
    it "returns a successful response" do
      get :info, params: { id: playlist.id }
      expect(response).to be_successful
    end 
  end

  describe "GET #delete" do
    it "returns a successful response" do
      get :delete, params: { id: playlist.id }
      expect(response).to be_successful
    end 
  end

  describe "POST #my_search" do
    it "returns a successful response" do
      post :my_search, params: { playlist: my_search_parameters }
      expect(response).to be_successful
    end 
  end

  describe "POST #search" do
    it "returns a successful response" do
      post :search, params: { playlist: search_parameters }
      expect(response).to be_successful
    end 
  end 

  describe "POST #create" do
    it "creates a new playlist and redirects to the playlist's edit page" do
      login(account)
      post :create, params: { playlist: playlist_parameters }
      expect(response).to redirect_to("/playlists/#{Playlist.last.id}/edit")
    end 
  end

  describe "POST #update" do
    it "updates the playlist's information and redirects to /account page" do
      post :update, params: { id: playlist.id, playlist: playlist_parameters }
      expect(response).to redirect_to("/account")
    end 
  end 

  describe "POST #add_song" do
    it "adds songs to playlist and redirects to playlist's edit page" do
      post :add_song, params: { id: playlist.id, song: song_parameters }
      expect(Song.last).to be_truthy
      expect(response).to redirect_to("/playlists/#{playlist.id}/edit")
    end 
  end

  describe "POST #add_click" do
    it "updates amount_of_listens and redirects to spotify page" do
      post :add_click, params: { id: playlist.id }
      expect(response).to redirect_to("#{playlist.playlist_link}")
    end 
  end   

  describe "POST #destroy" do
    it "deletes playlist and redirects to /account page" do
      post :destroy, params: { id: playlist.id }
      expect(Playlist.last).to be_falsey
      expect(response).to redirect_to("/account")
    end  
  end

end 