class PlaylistsController < ApplicationController
  before_action :set_playlist, only: %i[ update info add_song]

  # GET /
  def index
  end

  # GET /playlists/discover
  def discover
    @playlists = Playlist.all # prepopulates the discover page
  end

  # POST /playlists/discover
  def search
    query = playlist_params
    username = query[:username] + "%"
    playlist_name = query[:playlist_name] + "%"
    @playlists = Playlist.where("username LIKE ?", username).where("playlist_name LIKE ?", playlist_name)
  end

  # GET /account
  def account
    @playlists = Playlist.where(account_id: current_account)
  end 

  # POST /account
  def acc_search 
    query = playlist_params
    username = current_account.username + "%"
    playlist_name = query[:playlist_name] + "%"
    @playlists = Playlist.where("username LIKE ?", username).where("playlist_name LIKE ?", playlist_name)
  end 

  # GET /playlists/new
  def new
    @playlist = Playlist.new
  end

  # POST /playlists/new
  def create
     @playlist = Playlist.new(playlist_params)
     @playlist.account_id = current_account.id
     @playlist.save
    
     redirect_to "/playlists/#{@playlist.id}/edit"
  end

  # GET /playlists/:id/edit
  def edit
    @theplaylist = Playlist.find(params[:id])
  end
 
  # POST /playlists/:id/edit
  def update
    @playlist.update(playlist_params)
    redirect_to '/'
  end 

  # POST /playlists/:id/edit/add
  def add_song
    @song = Song.new
    song_name = params[:song_name]
    artist = params[:artist]
    @playlist.song.create(song_name: song_name, artist: artist)
    redirect_to "/playlists/#{@playlist.id}/edit"
  end 

  # GET /playlists/:id/info
  def info
  end

  # DELETE /playlists/1 or /playlists/1.json
  def destroy
    @playlist.destroy!
  end

  private
    def set_playlist
      @playlist = Playlist.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def playlist_params
      params.require(:playlist).permit(:username, :playlist_name, :category, :playlist_link, :amount_of_listens, :account_id)
    end
end
