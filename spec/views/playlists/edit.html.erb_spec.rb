require 'rails_helper'

RSpec.describe "playlists/edit", type: :view do
  let(:playlist) {
    Playlist.create!(
      username: "MyText",
      playlist_name: "MyText",
      category: "MyText",
      playlist_link: "MyText",
      amount_of_listens: 1
    )
  }

  before(:each) do
    assign(:playlist, playlist)
  end

  it "renders the edit playlist form" do
    render

    assert_select "form[action=?][method=?]", playlist_path(playlist), "post" do

      assert_select "textarea[name=?]", "playlist[username]"

      assert_select "textarea[name=?]", "playlist[playlist_name]"

      assert_select "textarea[name=?]", "playlist[category]"

      assert_select "textarea[name=?]", "playlist[playlist_link]"

      assert_select "input[name=?]", "playlist[amount_of_listens]"
    end
  end
end
