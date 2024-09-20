class SongsController < ApplicationController
  before_action :set_song, only: %i[ delete destroy ]

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
