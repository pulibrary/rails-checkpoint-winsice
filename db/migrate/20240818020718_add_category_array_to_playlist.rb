class AddCategoryArrayToPlaylist < ActiveRecord::Migration[7.1]
  def change
    add_column :playlists, :category, :string, array: true, default: []
  end
end
