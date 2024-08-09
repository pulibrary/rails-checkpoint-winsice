class RemoveUsernameFromPlaylist < ActiveRecord::Migration[7.1]
  def change
    remove_column :playlists, :username
  end
end
