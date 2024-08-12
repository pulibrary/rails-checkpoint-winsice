json.extract! playlist, :id, :playlist_name, :category, :playlist_link, :amount_of_listens, :created_at, :updated_at, :account_id
json.url playlist_url(playlist, format: :json)
