require 'rails_helper'

RSpec.describe "playlists/edit", type: :view do

  it "renders the edit playlist form" do

    assign(:playlist, Playlist.first)
    assign(:songs, Song.all)

    render

    assert_select "form[action=?][method=?]", "/playlists/1/edit/add", "post" do
      assert_select "form input", 11

      assert_select "input[name=?]", "song_name_1"
      assert_select "input[name=?]", "song_name_2"
      assert_select "input[name=?]", "song_name_3"
      assert_select "input[name=?]", "song_name_4"
      assert_select "input[name=?]", "song_name_5"

      assert_select "input[name=?]", "artist_1"
      assert_select "input[name=?]", "artist_2"
      assert_select "input[name=?]", "artist_3"
      assert_select "input[name=?]", "artist_4"
      assert_select "input[name=?]", "artist_5"

      assert_select "input[type=?]", "submit"
    end

    assert_select "form[action=?][method=?]", "/playlists/1/edit", "post" do
      assert_select "form input", 15

      assert_select "input[name=?]", "playlist[playlist_name]"
      assert_select "input[name=?]", "playlist[playlist_link]"
      assert_select "input[name=?]", "playlist[category][]"
      
      assert_select "input[type=?]", "submit"
    end 



  end
end
