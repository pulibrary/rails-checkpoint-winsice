require 'rails_helper'

RSpec.describe "songs/new", type: :view do
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

  it "renders new song form" do
    render

    assert_select "form[action=?][method=?]", songs_path, "post" do

      assert_select "input[name=?]", "song[playlist_id]"

      assert_select "textarea[name=?]", "song[song_name]"

      assert_select "textarea[name=?]", "song[artist]"
    end
  end
end
