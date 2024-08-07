json.extract! song, :id, :playlist_id, :song_name, :artist, :created_at, :updated_at
json.url song_url(song, format: :json)
