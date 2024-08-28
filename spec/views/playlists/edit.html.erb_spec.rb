require 'rails_helper'

RSpec.describe "playlists/edit", type: :view do
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

  it "renders the edit playlist form" do

    assign(:songs, Song.all)

    render

    assert_select "form[action=?][method=?]", "/playlists/1/edit/add", "post" do

      assert_select "form input", 11

      assert_select "text[name=?]", "song[song_name_1]"

      assert_select "textarea[name=?]", "playlist[playlist_name]"

      assert_select "textarea[name=?]", "playlist[category]"

      assert_select "textarea[name=?]", "playlist[playlist_link]"

      assert_select "input[name=?]", "playlist[amount_of_listens]"
    end
  end
end
