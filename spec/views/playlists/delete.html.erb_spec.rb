require 'rails_helper'

RSpec.describe "playlists/delete", type: :view do
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

  it "renders the delete page buttons" do

    render
  
    assert_select "form input", 2

    assert_select "form[action=?][method=?]", '/playlists/1/delete', "post" do
      assert_select "input[type=?]", "submit"
    end

    assert_select "form[action=?][method=?]", account_path, "get" do
      assert_select "input[type=?]", "submit"
    end

  end
end
