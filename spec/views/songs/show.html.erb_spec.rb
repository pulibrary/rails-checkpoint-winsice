require 'rails_helper'

RSpec.describe "songs/show", type: :view do
  before(:each) do
    assign(:account, Account.create!(
      id: 1,
      username: "MyText",
      password: "MyText"
    ))
    assign(:playlist, Playlist.create!(
      id: 2,
      playlist_name: "MyText",
      account_id: 1
    ))
    assign(:song, Song.create!(
      playlist_id: 2,
      song_name: "MyText",
      artist: "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
  end
end
