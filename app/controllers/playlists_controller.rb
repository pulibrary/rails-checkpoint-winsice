class PlaylistsController < ApplicationController
  before_action :set_playlist, only: %i[  ]

  # GET /
  def index
    @playlists = Playlist.all
  end

  def discover  
    @playlists = Playlist.all
  end 

  # POST
  def search
    query = playlist_params
    username = query[:username] + "%"
    playlist_name = query[:playlist_name] + "%"
    @playlists = Playlist.where("username LIKE ?", username).where("playlist_name LIKE ?", playlist_name)
  end 

  # GET /playlists/new
  def new
  end

  # POST /playlists/new
  def create
    @playlist = Playlist.new(playlist_params)
    # @playlist.account_id = session[:current_account]
    @playlist.save

    redirect_to "/playlists/#{@playlist.id}/edit"

    # respond_to do |format|
    #   if @playlist.save
    #     format.html { redirect_to edit, notice: "Playlist was successfully created." }
    #     format.json { render :show, status: :created, location: @playlist }
    #   else
    #     format.html { render :new, status: :unprocessable_entity }
    #     format.json { render json: @playlist.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # GET /playlists/:id/edit
  def edit
    @theplaylist = Playlist.find(params[:id])
  end
 
  def add_song
    @playlist = Playlist.find(params[:id])
    song_name = params[:song_name]
    artist = params[:artist]
    @playlist.song.create(song_name: song_name, artist: artist)
    redirect_to "/playlists/#{@playlist.id}/edit"

  end 
  # POST /playlists/:id/edit
  def update 
    @playlist = Playlist.find(params[:id])
    @playlist.update(playlist_params)
    redirect_to '/'
  end 

  # GET /playlists/:id/info
  def info 
    @playlist = Playlist.find(params[:id])
  end

  # # GET /playlists/1 or /playlists/1.json
  # def show
  # end

  

  # PATCH/PUT /playlists/1 or /playlists/1.json
  # def update
  #   respond_to do |format|
  #     if @playlist.update(playlist_params)
  #       format.html { redirect_to playlist_url(@playlist), notice: "Playlist was successfully updated." }
  #       format.json { render :show, status: :ok, location: @playlist }
  #     else
  #       format.html { render :edit, status: :unprocessable_entity }
  #       format.json { render json: @playlist.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /playlists/1 or /playlists/1.json
  def destroy
    @playlist.destroy!

    respond_to do |format|
      format.html { redirect_to playlists_url, notice: "Playlist was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_playlist
      @playlist = Playlist.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def playlist_params
      params.require(:playlist).permit(:username, :playlist_name, :category, :playlist_link, :amount_of_listens)
    end
end
