FactoryBot.define do
  factory :playlist do
    id { 1 }
    playlist_name { "testPlaylist" }
    playlist_link { "testLink" }
    amount_of_listens { 10 }
    account_id { 1 }
    category { ["Classical, Kpop"] }
  end
end 