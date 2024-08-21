class SongsController < ApplicationController
  before_action :set_song, only: %i[ show edit update delete destroy ]

  def add_song
  end 
  # GET /songs or /songs.json
  def index
    @songs = Song.all
  end

  # GET /songs/new
  def new
    @song = Song.new
  end

  # POST /songs or /songs.json
  def create
    @song = Song.new(song_params)

    respond_to do |format|
      if @song.save
        format.html { redirect_to song_url(@song), notice: "Song was successfully created." }
        format.json { render :show, status: :created, location: @song }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /songs/1 or /songs/1.json
  def update
    respond_to do |format|
      if @song.update(song_params)
        format.html { redirect_to song_url(@song), notice: "Song was successfully updated." }
        format.json { render :show, status: :ok, location: @song }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  def delete 
    
  end 

  # DELETE /songs/1 or /songs/1.json
  def destroy
    playlist_id = @song.playlist_id
    Song.delete(params[:id])
    redirect_to "/playlists/#{playlist_id}/edit"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_song
      @song = Song.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def song_params
      params.require(:song).permit(:playlist_id, :song_name, :artist)
    end
end
