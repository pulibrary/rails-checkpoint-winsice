class RemoveCategoryFromPlaylist < ActiveRecord::Migration[7.1]
  def change
    remove_column :playlists, :category
  end
end
