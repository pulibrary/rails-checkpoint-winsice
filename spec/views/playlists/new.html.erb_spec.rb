require 'rails_helper'

RSpec.describe "playlists/new", type: :view do
  before(:each) do
    assign(:playlist, Playlist.new(
      username: "MyText",
      playlist_name: "MyText",
      category: "MyText",
      playlist_link: "MyText",
      amount_of_listens: 1
    ))
  end

  it "renders new playlist form" do
    render

    assert_select "form[action=?][method=?]", playlists_path, "post" do

      assert_select "textarea[name=?]", "playlist[username]"

      assert_select "textarea[name=?]", "playlist[playlist_name]"

      assert_select "textarea[name=?]", "playlist[category]"

      assert_select "textarea[name=?]", "playlist[playlist_link]"

      assert_select "input[name=?]", "playlist[amount_of_listens]"
    end
  end
end
