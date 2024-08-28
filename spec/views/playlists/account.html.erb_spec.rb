require 'rails_helper'

RSpec.describe "playlists/account", type: :view do
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
    assign(:song, Song.create!(
      playlist_id: 1,
      song_name: "MyText",
      artist: "MyText"
    ))
  end

  it "renders the account search form" do


    # allow(session).to receive(:account_id).and_return(1)
    session[:account_id] = 1
    # assign(session[:account_id], 1)
    assign(:post_url, account_path)
    assign(:playlists, Playlist.all)
    # byebug
    render
  
    assert_select "form input", 19

    assert_select "form[action=?][method=?]", account_path, "post" do

      assert_select "input[name=?]", "playlist[playlist_name]"
      assert_select "input[name=?]", "playlist[amount_of_listens]"
      assert_select "input[name=?]", "playlist[category][]"
      assert_select "input[type=?]", "submit"
  
    end
  end
end
