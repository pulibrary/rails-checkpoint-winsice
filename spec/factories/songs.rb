FactoryBot.define do
  factory :song do
    id { 1 }
    playlist_id { 1 }
    song_name { "testSong" }
    artist { "testArtist" }
  end
end 