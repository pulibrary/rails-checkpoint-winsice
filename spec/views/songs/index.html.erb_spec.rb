require 'rails_helper'

RSpec.describe "songs/index", type: :view do
  before(:each) do
    assign(:songs, [
      Song.create!(
        playlist_id: 2,
        song_name: "MyText",
        artist: "MyText"
      ),
      Song.create!(
        playlist_id: 2,
        song_name: "MyText",
        artist: "MyText"
      )
    ])
  end

  it "renders a list of songs" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
  end
end
