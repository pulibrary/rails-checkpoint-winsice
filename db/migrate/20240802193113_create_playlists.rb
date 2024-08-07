class CreatePlaylists < ActiveRecord::Migration[7.1]
  def change
    create_table :playlists do |t|
      t.text :username
      t.text :playlist_name
      t.text :category
      t.text :playlist_link
      t.integer :amount_of_listens

      t.timestamps
    end
  end
end
