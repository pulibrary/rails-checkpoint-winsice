class PlaylistsController < ApplicationController
  before_action :set_playlist, only: %i[ edit update info add_song add_click delete ]
 
  # GET /
  def index
    current_account
  end

  # GET /playlists/discover
  def discover
    @playlist = Playlist.new
    @playlists = Playlist.all # prepopulates the discover page
    @post_url = '/playlists/search'
  end

  # POST
  def my_search
    @playlist = Playlist.new
    @post_url = '/account/search'
    query = playlist_params

    playlist_name = query[:playlist_name] + "%"
    categories = query[:category]
    clicks = query[:amount_of_listens]

    if clicks.nil? 
      clicks = 0
    end 
    
    playlist_query = Playlist.where("account_id = ?", current_account).where("playlist_name ILIKE ?", playlist_name).where("amount_of_listens >= ?", clicks)
    playlist_query = playlist_query.select { |p| (p.category - categories).length() != p.category.length() } unless categories.nil?

    @playlists = playlist_query

    render "mysearch", playlist: @playlist, post_url: @post_url, playlists: @playlists
  end

  # GET /account
  def account
    @playlist = Playlist.new
    @playlists = Playlist.where(account_id: current_account)
    @post_url = '/account/search'
  end 

  # POST /account
  def search 
    @playlist = Playlist.new
    @post_url = '/playlists/search'
    query = playlist_params

    username = query[:username] + "%"
    playlist_name = query[:playlist_name] + "%"
    categories = query[:category]
    clicks = query[:amount_of_listens]
  
    usernames = Account.where("username LIKE ?", username).ids

    if clicks.nil? 
      clicks = 0
    end 
    
    playlist_query = Playlist.where(account_id: usernames).where("playlist_name ILIKE ?", playlist_name).where("amount_of_listens >= ?", clicks)

    playlist_query = playlist_query.select { |p| (p.category - categories).length() != p.category.length() } unless categories.nil?

    @playlists = playlist_query

    render "search", playlist: @playlist, post_url: @post_url, playlists: @playlists
  end 

  # GET /playlists/new
  def new
    @playlist = Playlist.new
    @username = Account.find(current_account.id).username
  end

  # POST /playlists/new
  def create
     @playlist = Playlist.new(playlist_params)
     @playlist.amount_of_listens = 0
     @playlist.account_id = current_account.id
     @playlist.save

     redirect_to "/playlists/#{@playlist.id}/edit"
  end

  # GET /playlists/:id/edit
  def edit
    @song = Song.new
    @songs = Song.where("playlist_id = ?", @playlist.id)
  end
 
  # POST /playlists/:id/edit
  def update
    @playlist.update(playlist_params)
    redirect_to '/account'
  end 

  # POST /playlists/:id/edit/add
  def add_song
    params = song_params
    
    unless params[:song_name_1].empty? || params[:artist_1].empty? then @playlist.song.create(playlist_id: @playlist.id, song_name: params[:song_name_1], artist: params[:artist_1]) end
    unless params[:song_name_2].empty? || params[:artist_2].empty? then @playlist.song.create(playlist_id: @playlist.id, song_name: params[:song_name_2], artist: params[:artist_2]) end
    unless params[:song_name_3].empty? || params[:artist_3].empty? then @playlist.song.create(playlist_id: @playlist.id, song_name: params[:song_name_3], artist: params[:artist_3]) end
    unless params[:song_name_4].empty? || params[:artist_4].empty? then @playlist.song.create(playlist_id: @playlist.id, song_name: params[:song_name_4], artist: params[:artist_4]) end
    unless params[:song_name_5].empty? || params[:artist_5].empty? then @playlist.song.create(playlist_id: @playlist.id, song_name: params[:song_name_5], artist: params[:artist_5]) end

    redirect_to "/playlists/#{@playlist.id}/edit"
  end 

  # GET /playlists/:id/info
  def info
    @username = Account.find(@playlist.account_id).username
    @categories = @playlist.category
    @songs = Song.where("playlist_id = ?", @playlist.id)
  end

  def delete 
    
  end 

  # POST /playlists/1 or /playlists/1.json
  def destroy
    Playlist.delete(params[:id])
    redirect_to '/account'
  end

  # POST 
  def add_click
    @playlist.update(amount_of_listens: @playlist.amount_of_listens + 1)
    redirect_to "#{@playlist.playlist_link}", allow_other_host: true
  end


  private

    def set_playlist
      @playlist = Playlist.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def playlist_params
      params.require(:playlist).permit(:username, :playlist_name, :playlist_link, :amount_of_listens, :account_id, :category => [])
    end

    def song_params
      params.require(:song).permit(:song_name_1, :song_name_2, :song_name_3, :song_name_4, :song_name_5,
                                   :artist_1,:artist_2, :artist_3, :artist_4, :artist_5)
    end

    def current_account
      @current_account ||= Account.where(id: session[:account_id]).first
    end

end
