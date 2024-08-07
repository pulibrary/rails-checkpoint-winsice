class CreateSongs < ActiveRecord::Migration[7.1]
  def change
    create_table :songs do |t|
      t.integer :playlist_id
      t.text :song_name
      t.text :artist

      t.timestamps
    end
  end
end
