require 'rails_helper'

RSpec.describe "playlists/search", type: :view do
  before(:each) do
    assign(:account, Account.create!(
      id: 1,
      username: "MyText",
      password: "MyText"
    ))
    assign(:playlist, Playlist.create!(
      id: 1,
      playlist_name: "MyText",
      account_id: 1
    ))
    assign(:song, Song.new(
      playlist_id: 1,
      song_name: "MyText",
      artist: "MyText"
    ))
  end

  it "renders the search playlist search form for discover" do

    assign(:post_url, playlists_search_path)
    assign(:playlists, Playlist.all)
    session[:account_id] = 1

    render
  
    assert_select "form input", 20

    assert_select "form[action=?][method=?]", playlists_search_path, "post" do

      assert_select "input[name=?]", "playlist[username]"
      assert_select "input[name=?]", "playlist[playlist_name]"

      assert_select "input[name=?]", "playlist[amount_of_listens]"
      assert_select "input[name=?]", "playlist[category][]"
      
      assert_select "input[type=?]", "submit"
      
    end
  end
end
