require 'rails_helper'

RSpec.describe "songs/new", type: :view do
  before(:each) do
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
