class AddAccountIdToPlaylist < ActiveRecord::Migration[7.1]
  def change
    add_column :playlists, :account_id, :integer
  end
end
