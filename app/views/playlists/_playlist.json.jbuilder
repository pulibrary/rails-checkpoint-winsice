json.extract! playlist, :id, :username, :playlist_name, :category, :playlist_link, :amount_of_listens, :created_at, :updated_at
json.url playlist_url(playlist, format: :json)
