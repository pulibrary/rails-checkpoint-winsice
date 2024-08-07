require 'rails_helper'

RSpec.describe "songs/edit", type: :view do
  let(:song) {
    Song.create!(
      playlist_id: 1,
      song_name: "MyText",
      artist: "MyText"
    )
  }

  before(:each) do
    assign(:song, song)
  end

  it "renders the edit song form" do
    render

    assert_select "form[action=?][method=?]", song_path(song), "post" do

      assert_select "input[name=?]", "song[playlist_id]"

      assert_select "textarea[name=?]", "song[song_name]"

      assert_select "textarea[name=?]", "song[artist]"
    end
  end
end
