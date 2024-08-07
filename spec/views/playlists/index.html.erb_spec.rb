require 'rails_helper'

RSpec.describe "playlists/index", type: :view do
  before(:each) do
    assign(:playlists, [
      Playlist.create!(
        username: "MyText",
        playlist_name: "MyText",
        category: "MyText",
        playlist_link: "MyText",
        amount_of_listens: 2
      ),
      Playlist.create!(
        username: "MyText",
        playlist_name: "MyText",
        category: "MyText",
        playlist_link: "MyText",
        amount_of_listens: 2
      )
    ])
  end

  it "renders a list of playlists" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
  end
end
