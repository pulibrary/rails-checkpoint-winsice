require 'rails_helper'

RSpec.describe "playlists/show", type: :view do
  before(:each) do
    assign(:playlist, Playlist.create!(
      username: "MyText",
      playlist_name: "MyText",
      category: "MyText",
      playlist_link: "MyText",
      amount_of_listens: 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/2/)
  end
end
